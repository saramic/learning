/*
  based on Blink

  blink 1 second on and 1 second off

  blinks that get closer together and farther appart

  blink SOS
*/

// the setup function runs once when you press reset or power the board
void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
}

// blink 1 second on 1 second off times times
void blink1SecondOnOffTimes(int times) {
  for(int i = 0; i < times; i++) {
    blinkFor(1000);
  }
}

void onOffFor(int onMillis, int offMillis) {
  digitalWrite(LED_BUILTIN, HIGH);
  delay(onMillis);
  digitalWrite(LED_BUILTIN, LOW);
  delay(offMillis);
}

void blinkFor(int millis) {
  onOffFor(millis, millis);
}

// the loop function runs over and over again forever
void loop() {
  // blink on and off 5 times
  blink1SecondOnOffTimes(5);

  // linear increase speed of blink
  for(int millis = 1000; millis > 0; millis -= 100) {
    blinkFor(millis);
  }

  // sinusoidal decrease in speed of blink
  for(int i = 100; i > 0; i -= 5) {
    int millis = 400.0 * (1.0 + cos(i/100.0 * PI));
    blinkFor(millis);
  }
  
  // SOS
  for(int i = 0; i < 3; i++) {
    onOffFor(900, 300);
  }
  for(int i = 0; i < 3; i++) {
    onOffFor(300, 300);
  }
  for(int i = 0; i < 3; i++) {
    onOffFor(900, 300);
  }
  delay(1000);
}
