// Single-motor bring-up test — motor on STEP = GPIO 4 (voice 0 path only)
//
// Same tone path as the synth: LEDC channel 0 -> GPIO 4, A4988 EN on GPIO 18.
// MCPWM and the other 6 voices are not touched.
//
// Build/upload:  pio run -e test-motor -t upload -t monitor
// Back to synth: pio run -e esp32-s3-devkitc-1 -t upload
//
// At boot it runs the full sequence once, then drops into a serial menu.

#include <Arduino.h>

// ---------------- Pin map (must match src/main.cpp voice 0) ----------------
static const int PIN_STEP = 4;
static const int PIN_ENABLE = 18; // A4988 EN, active LOW
static const int PIN_DIR = -1;    // set to a GPIO if DIR is wired, else -1

static const uint8_t LEDC_CHAN = 0;
static const uint8_t LEDC_RES_BITS = 10;
static const uint32_t DUTY_50 = (1 << (LEDC_RES_BITS - 1)); // 50% square wave

// ---------------- Test parameters ----------------
static const float SWEEP_START_HZ = 30.0f;
static const float SWEEP_END_HZ = 2500.0f;
static const uint32_t SWEEP_MS = 8000;  // time for one full sweep
static const uint8_t SCALE_LOW = 48;    // C3
static const uint8_t SCALE_HIGH = 84;   // C6
static const uint32_t NOTE_MS = 220;    // note length in the scale test

static bool driverEnabled = false;
static float currentFreq = 0.0f;

static float noteToFreq(float note) {
  return 440.0f * powf(2.0f, (note - 69.0f) / 12.0f);
}

// ---------------- Low level ----------------
static void driverEnable(bool on) {
  driverEnabled = on;
  digitalWrite(PIN_ENABLE, on ? LOW : HIGH); // active LOW
  Serial.printf("[EN ] driver %s\n", on ? "ENABLED (holding torque on)"
                                        : "DISABLED (shaft free)");
}

static void stepTone(float freq) {
  if (freq < 16.0f) freq = 16.0f;
  currentFreq = freq;
  ledcWriteTone(LEDC_CHAN, freq);
  ledcWrite(LEDC_CHAN, DUTY_50); // ledcWriteTone leaves duty at 50% already,
                                 // set explicitly so pulse width is certain
}

static void stepStop() {
  currentFreq = 0.0f;
  ledcWriteTone(LEDC_CHAN, 0);
  ledcWrite(LEDC_CHAN, 0);
}

// ---------------- Individual tests ----------------

// 1. Is the pin alive at all? Slow, countable pulses via plain GPIO toggling.
//    At 200 steps/rev and 200 Hz this is 1 rev/s — you should see it turn.
static void testSlowPulses() {
  Serial.println("\n[1/5] Slow manual pulses — 400 steps @ 200 Hz (2 revs)");
  Serial.println("      Expect: smooth slow rotation, audible ticking.");
  ledcDetachPin(PIN_STEP);
  pinMode(PIN_STEP, OUTPUT);
  for (int i = 0; i < 400; i++) {
    digitalWrite(PIN_STEP, HIGH);
    delayMicroseconds(10); // A4988 needs >1us; 10us is comfortable
    digitalWrite(PIN_STEP, LOW);
    delayMicroseconds(4990);
  }
  ledcAttachPin(PIN_STEP, LEDC_CHAN); // hand the pin back to LEDC
  stepStop();
  Serial.println("      done.");
}

// 2. Fixed tones across the useful musical range.
static void testFixedTones() {
  static const float tones[] = {65.41f,  130.81f, 261.63f,
                                523.25f, 1046.5f, 1567.98f};
  Serial.println("\n[2/5] Fixed tones — C2 C3 C4 C5 C6 G6, 600 ms each");
  Serial.println("      Expect: clean pitch steps. Note where it stalls/buzzes.");
  for (size_t i = 0; i < sizeof(tones) / sizeof(tones[0]); i++) {
    Serial.printf("      %7.2f Hz\n", tones[i]);
    stepTone(tones[i]);
    delay(600);
  }
  stepStop();
  delay(200);
}

// 3. Linear frequency ramp — finds the stall ceiling of this motor/Vref/PSU.
static void testSweep() {
  Serial.printf("\n[3/5] Sweep %.0f -> %.0f Hz over %lu ms\n", SWEEP_START_HZ,
                SWEEP_END_HZ, (unsigned long)SWEEP_MS);
  Serial.println("      Expect: rising tone. The Hz where it screeches and");
  Serial.println("      stops turning is your practical top note.");
  const uint32_t t0 = millis();
  uint32_t elapsed = 0;
  uint32_t lastPrint = 0;
  while ((elapsed = millis() - t0) < SWEEP_MS) {
    float k = (float)elapsed / (float)SWEEP_MS;
    float f = SWEEP_START_HZ + k * (SWEEP_END_HZ - SWEEP_START_HZ);
    stepTone(f);
    if (elapsed - lastPrint >= 1000) {
      lastPrint = elapsed;
      Serial.printf("      %5.0f Hz\n", f);
    }
    delay(5);
  }
  stepStop();
  delay(200);
}

// 4. Chromatic scale through the exact noteToFreq() the synth uses.
static void testChromaticScale() {
  Serial.printf("\n[4/5] Chromatic scale, MIDI note %u -> %u\n", SCALE_LOW,
                SCALE_HIGH);
  Serial.println("      Expect: every semitone distinct — this is the synth's");
  Serial.println("      own note->freq math, so it is what MIDI will sound like.");
  for (uint8_t n = SCALE_LOW; n <= SCALE_HIGH; n++) {
    float f = noteToFreq(n);
    Serial.printf("      note %3u  %7.2f Hz\n", n, f);
    stepTone(f);
    delay(NOTE_MS);
  }
  stepStop();
  delay(200);
}

// 5. Note on/off gating — silence must be actual silence, not a stuck pin.
static void testGating() {
  Serial.println("\n[5/5] Note on/off gating — 4x (200 ms on, 300 ms off)");
  Serial.println("      Expect: crisp starts and full stops, no residual hum.");
  for (int i = 0; i < 4; i++) {
    stepTone(noteToFreq(60)); // C4
    delay(200);
    stepStop();
    delay(300);
  }
}

static void runAllTests() {
  Serial.println("\n=============================================");
  Serial.printf("  Single motor test — STEP=GPIO %d, EN=GPIO %d\n", PIN_STEP,
                PIN_ENABLE);
  Serial.println("=============================================");
  driverEnable(true);
  delay(300);
  testSlowPulses();
  testFixedTones();
  testSweep();
  testChromaticScale();
  testGating();
  stepStop();
  Serial.println("\nSequence complete. Motor idle, driver still enabled.");
}

// ---------------- Serial menu ----------------
static void printMenu() {
  Serial.println("\n--- commands ---");
  Serial.println("  a          run the full sequence again");
  Serial.println("  1..5       run one test (slow/tones/sweep/scale/gating)");
  Serial.println("  p <hz>     hold a frequency, e.g.  p 440");
  Serial.println("  n <note>   hold a MIDI note,   e.g.  n 60");
  Serial.println("  x          stop stepping");
  Serial.println("  e          toggle driver enable");
  Serial.println("  d          toggle DIR (needs PIN_DIR set)");
  Serial.println("  s          status");
  Serial.println("  ?          this menu");
}

static void printStatus() {
  Serial.printf("[ST ] driver=%s  step=%s", driverEnabled ? "on" : "off",
                currentFreq > 0.0f ? "running" : "idle");
  if (currentFreq > 0.0f) Serial.printf(" @ %.2f Hz", currentFreq);
  Serial.println();
}

static void handleCommand(String line) {
  line.trim();
  if (line.length() == 0) return;
  const char c = line.charAt(0);
  const String arg = line.substring(1);

  switch (c) {
    case 'a': runAllTests(); break;
    case '1': testSlowPulses(); break;
    case '2': testFixedTones(); break;
    case '3': testSweep(); break;
    case '4': testChromaticScale(); break;
    case '5': testGating(); break;
    case 'p': {
      float f = arg.toFloat();
      if (f <= 0.0f) { Serial.println("[ERR] usage: p <hz>"); break; }
      stepTone(f);
      Serial.printf("[TON] holding %.2f Hz\n", f);
      break;
    }
    case 'n': {
      int n = arg.toInt();
      if (n < 0 || n > 127) { Serial.println("[ERR] usage: n <0..127>"); break; }
      float f = noteToFreq(n);
      stepTone(f);
      Serial.printf("[TON] note %d = %.2f Hz\n", n, f);
      break;
    }
    case 'x': stepStop(); Serial.println("[TON] stopped"); break;
    case 'e': driverEnable(!driverEnabled); break;
    case 'd': {
      if (PIN_DIR < 0) { Serial.println("[ERR] PIN_DIR not wired"); break; }
      int v = !digitalRead(PIN_DIR);
      digitalWrite(PIN_DIR, v);
      Serial.printf("[DIR] %s\n", v ? "HIGH" : "LOW");
      break;
    }
    case 's': printStatus(); break;
    case '?': printMenu(); break;
    default: Serial.printf("[ERR] unknown command '%c' — send ? for help\n", c);
  }
}

// ---------------- Setup / loop ----------------
void setup() {
  Serial.begin(115200);
  delay(1500); // let USB-CDC enumerate so the first prints are not lost

  pinMode(PIN_ENABLE, OUTPUT);
  digitalWrite(PIN_ENABLE, HIGH); // driver off during init
  if (PIN_DIR >= 0) {
    pinMode(PIN_DIR, OUTPUT);
    digitalWrite(PIN_DIR, LOW);
  }

  ledcSetup(LEDC_CHAN, 1000, LEDC_RES_BITS);
  ledcAttachPin(PIN_STEP, LEDC_CHAN);
  ledcWrite(LEDC_CHAN, 0);

  runAllTests();
  printMenu();
}

void loop() {
  static String line;
  while (Serial.available() > 0) {
    char c = (char)Serial.read();
    if (c == '\n' || c == '\r') {
      if (line.length() > 0) {
        handleCommand(line);
        line = "";
      }
    } else if (line.length() < 32) {
      line += c;
    }
  }
}
