const int buttonPin = 7;
int buttonState = 0;
int oldButtonState = LOW;
int ledState = LOW;

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(buttonPin, INPUT_PULLUP);

}

void loop() {
  buttonState = digitalRead(buttonPin);

  if (buttonState != oldButtonState && buttonState == HIGH) {
    ledState = (ledState == LOW ? HIGH : LOW);
    digitalWrite(LED_BUILTIN, ledState);
    delay(50);
  }
  oldButtonState = buttonState;
}
