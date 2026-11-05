// Motor test — runs each of the 5 motors in turn, one revolution forward,
// one revolution back.
//
// Build/upload:  pio run -e test-motor -t upload -t monitor

#include <Arduino.h>

static const int NUM_MOTORS = 5;
static const int STEP_PINS[NUM_MOTORS] = {4, 5, 6, 7, 15};
static const int DIR_PINS[NUM_MOTORS] = {16, 17, 18, 8, 3};

static const int STEPS_PER_REV = 200;
static const int STEP_DELAY_US = 2500; // 200 steps/s

static void spin(int m, bool forward) {
  digitalWrite(DIR_PINS[m], forward ? HIGH : LOW);
  Serial.printf("  DIR GPIO %d = %s (read back %d), stepping %d...",
                DIR_PINS[m], forward ? "HIGH" : "LOW",
                digitalRead(DIR_PINS[m]), STEPS_PER_REV);
  uint32_t t0 = millis();
  for (int i = 0; i < STEPS_PER_REV; i++) {
    digitalWrite(STEP_PINS[m], HIGH);
    delayMicroseconds(10);
    digitalWrite(STEP_PINS[m], LOW);
    delayMicroseconds(STEP_DELAY_US);
  }
  Serial.printf(" done in %lu ms\n", (unsigned long)(millis() - t0));
}

void setup() {
  Serial.begin(115200);
  delay(1500); // let USB serial connect so the first lines are not lost
  Serial.println("\n=== motor test boot ===");
  for (int m = 0; m < NUM_MOTORS; m++) {
    pinMode(STEP_PINS[m], OUTPUT);
    pinMode(DIR_PINS[m], OUTPUT);
    digitalWrite(STEP_PINS[m], LOW);
    Serial.printf("motor %d: STEP GPIO %d, DIR GPIO %d -> output\n", m + 1,
                  STEP_PINS[m], DIR_PINS[m]);
  }
  Serial.println("ESP32 side is running. If no motor moves, check driver");
  Serial.println("power (VMOT 12V + VDD 3.3V), common GND, EN, RESET/SLEEP.");
}

void loop() {
  for (int m = 0; m < NUM_MOTORS; m++) {
    Serial.printf("\nmotor %d (STEP %d, DIR %d)\n", m + 1, STEP_PINS[m],
                  DIR_PINS[m]);
    spin(m, true);
    delay(300);
    spin(m, false);
    delay(2000); // clear gap so it's obvious which motor is which
  }
}
