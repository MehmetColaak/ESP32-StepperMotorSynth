// ESP32-S3 MIDI Stepper Motor Synth — 5 motors, 5 MIDI channels
// Inspired by jzkmath/Arduino-MIDI-Stepper-Motor-Instrument
//
// MIDI channel 1..5  ->  motor/voice 0..4
// Note On / Note Off / Pitch Bend / CC120+123 (all sound/notes off)
// Raw MIDI bytes arrive over USB-CDC serial from Max/MSP.
//
// Voices 0..3: LEDC channels 0,2,4,6 (one per LEDC hardware timer)
// Voice 4:     MCPWM unit 0, timer 0, output A

#include <Arduino.h>
#include "driver/mcpwm.h"

// ---------------- Pin map ----------------
static const int STEP_PINS[5] = {4, 5, 6, 7, 15};
static const int DIR_PINS[5] = {16, 17, 18, 8, 3};
// A4988 EN is not wired: the drivers are always enabled.

static const uint8_t LEDC_CH[4] = {0, 2, 4, 6};
static const mcpwm_timer_t MC_TIMER[1] = {MCPWM_TIMER_0};
static const mcpwm_io_signals_t MC_IO[1] = {MCPWM0A};

// ---------------- Voice state ----------------
static const int NUM_VOICES = 5;
static const float BEND_RANGE = 2.0f; // semitones, +/-

struct Voice {
  int8_t note = -1;  // currently sounding MIDI note, -1 = silent
  float bend = 0.0f; // current bend in semitones
};
static Voice voices[NUM_VOICES];

static float noteToFreq(float note) {
  return 440.0f * powf(2.0f, (note - 69.0f) / 12.0f);
}

static void voiceSetFreq(int v, float freq) {
  if (freq < 16.0f) freq = 16.0f;
  if (v < 4) {
    ledcWriteTone(LEDC_CH[v], freq);
  } else {
    int i = v - 4;
    mcpwm_set_frequency(MCPWM_UNIT_0, MC_TIMER[i], (uint32_t)freq);
    mcpwm_set_duty(MCPWM_UNIT_0, MC_TIMER[i], MCPWM_OPR_A, 50.0f);
    mcpwm_set_duty_type(MCPWM_UNIT_0, MC_TIMER[i], MCPWM_OPR_A,
                        MCPWM_DUTY_MODE_0);
  }
}

static void voiceSilence(int v) {
  if (v < 4) {
    ledcWriteTone(LEDC_CH[v], 0);
  } else {
    mcpwm_set_signal_low(MCPWM_UNIT_0, MC_TIMER[v - 4], MCPWM_OPR_A);
  }
}

// ---------------- MIDI actions ----------------
static void midiNoteOn(uint8_t ch, uint8_t note, uint8_t vel) {
  if (ch >= NUM_VOICES) return;
  if (vel == 0) { // note on with velocity 0 = note off
    if (voices[ch].note == (int8_t)note) {
      voices[ch].note = -1;
      voiceSilence(ch);
    }
    return;
  }
  voices[ch].note = note; // last-note priority per channel
  voiceSetFreq(ch, noteToFreq(note + voices[ch].bend));
}

static void midiNoteOff(uint8_t ch, uint8_t note) {
  if (ch >= NUM_VOICES) return;
  if (voices[ch].note == (int8_t)note) {
    voices[ch].note = -1;
    voiceSilence(ch);
  }
}

static void midiPitchBend(uint8_t ch, uint8_t lsb, uint8_t msb) {
  if (ch >= NUM_VOICES) return;
  int16_t raw = ((int16_t)(msb << 7 | lsb)) - 8192; // -8192..8191
  voices[ch].bend = (raw / 8192.0f) * BEND_RANGE;
  if (voices[ch].note >= 0) {
    voiceSetFreq(ch, noteToFreq(voices[ch].note + voices[ch].bend));
  }
}

static void midiControlChange(uint8_t ch, uint8_t cc, uint8_t val) {
  (void)val;
  if (cc == 120 || cc == 123) { // all sound off / all notes off
    if (ch < NUM_VOICES) {
      voices[ch].note = -1;
      voiceSilence(ch);
    }
  }
}

static void allSilent() {
  for (int v = 0; v < NUM_VOICES; v++) {
    voices[v].note = -1;
    voiceSilence(v);
  }
}

// ---------------- MIDI byte-stream parser ----------------
// Handles running status. Ignores system messages and unsupported types.
static uint8_t midiStatus = 0;
static uint8_t midiData[2];
static uint8_t midiDataCount = 0;
static uint8_t midiDataNeeded = 0;

static uint8_t bytesNeededFor(uint8_t status) {
  switch (status & 0xF0) {
    case 0xC0:
    case 0xD0:
      return 1; // program change, channel pressure
    default:
      return 2; // note on/off, CC, pitch bend, poly aftertouch
  }
}

static void dispatchMidi() {
  uint8_t type = midiStatus & 0xF0;
  uint8_t ch = midiStatus & 0x0F;
  switch (type) {
    case 0x90: midiNoteOn(ch, midiData[0], midiData[1]); break;
    case 0x80: midiNoteOff(ch, midiData[0]); break;
    case 0xE0: midiPitchBend(ch, midiData[0], midiData[1]); break;
    case 0xB0: midiControlChange(ch, midiData[0], midiData[1]); break;
    default: break; // other message types ignored
  }
}

static void parseMidiByte(uint8_t b) {
  if (b >= 0xF8) return; // real-time messages: ignore entirely
  if (b >= 0xF0) {       // system common: cancels running status
    midiStatus = 0;
    midiDataCount = 0;
    return;
  }
  if (b & 0x80) { // new status byte
    midiStatus = b;
    midiDataCount = 0;
    midiDataNeeded = bytesNeededFor(b);
    return;
  }
  if (midiStatus == 0) return; // stray data byte before any status
  midiData[midiDataCount++] = b;
  if (midiDataCount >= midiDataNeeded) {
    dispatchMidi();
    midiDataCount = 0; // running status: keep status, wait for new data
  }
}

// ---------------- Setup / loop ----------------
void setup() {
  Serial.begin(115200); // baud ignored on USB-CDC, kept for compatibility

  for (int v = 0; v < NUM_VOICES; v++) {
    pinMode(DIR_PINS[v], OUTPUT);
    digitalWrite(DIR_PINS[v], LOW); // direction doesn't matter for pitch
  }

  for (int v = 0; v < 4; v++) {
    ledcSetup(LEDC_CH[v], 1000, 10);
    ledcAttachPin(STEP_PINS[v], LEDC_CH[v]);
    ledcWrite(LEDC_CH[v], 0);
  }

  mcpwm_config_t cfg;
  cfg.frequency = 1000;
  cfg.cmpr_a = 0;
  cfg.cmpr_b = 0;
  cfg.duty_mode = MCPWM_DUTY_MODE_0;
  cfg.counter_mode = MCPWM_UP_COUNTER;
  for (int i = 0; i < 1; i++) {
    mcpwm_gpio_init(MCPWM_UNIT_0, MC_IO[i], STEP_PINS[4 + i]);
    mcpwm_init(MCPWM_UNIT_0, MC_TIMER[i], &cfg);
    mcpwm_set_signal_low(MCPWM_UNIT_0, MC_TIMER[i], MCPWM_OPR_A);
  }

  allSilent();
}

void loop() {
  while (Serial.available() > 0) {
    parseMidiByte((uint8_t)Serial.read());
  }
}