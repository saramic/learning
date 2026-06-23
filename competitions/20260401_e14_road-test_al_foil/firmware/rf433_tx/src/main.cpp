#include <Arduino.h>

// FS1000A DATA pin — OOK transmitter outputs 433.92 MHz carrier when HIGH.
// Wiring: Arduino D11 → FS1000A DATA; FS1000A VCC → 5V; FS1000A GND → GND.
#define TX_PIN 11

void setup() {
    Serial.begin(115200);
    pinMode(TX_PIN, OUTPUT);
    digitalWrite(TX_PIN, HIGH);
    Serial.println(F("433 MHz TX | continuous carrier ON"));
    Serial.print(F("DATA pin ")); Serial.print(TX_PIN); Serial.println(F(" HIGH"));
}

void loop() {
    // carrier is on — nothing to do
}
