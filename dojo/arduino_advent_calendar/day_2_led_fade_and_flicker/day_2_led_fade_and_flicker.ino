/*
  Blink, fade and flicker
*/

int ledPins[] = {3,5,9};                           // PWM pins
int pinCount = sizeof(ledPins)/sizeof(ledPins[0]); // length of above array
int brightness = 0;
int fadeAmount = 5;
int builtInFlashInterval = 1000;
int builtInState = HIGH;
unsigned long builtInPreviousMillis = 0;

// the setup function runs once when you press reset or power the board
void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  for (int thisPin = 0; thisPin < pinCount; thisPin++) {
    pinMode(ledPins[thisPin], OUTPUT);
  }
}

// the loop function runs over and over again forever
void loop() {
  unsigned long currentMillis = millis();
  
  // flash onboard pin
  if (currentMillis - builtInPreviousMillis > builtInFlashInterval) {
    builtInPreviousMillis = currentMillis;
    digitalWrite(LED_BUILTIN, builtInState);
    if (builtInState == HIGH) {
      builtInState = LOW;
    } else {
      builtInState = HIGH;
    }
  }

  // PWM fade LED pins
  float something = currentMillis/900.0;
  int value = 90.0 + (82.0 * sin( something * 2.0 * PI ));
  for (int thisPin = 0; thisPin < pinCount - 1; thisPin++) {
    analogWrite(ledPins[thisPin], value);
  }
  analogWrite(ledPins[pinCount - 1], brightness);

  // PWM fade 1 after another??
  for (int thisPin = 0; thisPin < pinCount; thisPin++) {
    int fade = 90.0 + (82.0 * sin( ((thisPin/3.0) + something) * 2.0 * PI) );
    // TODO how to make this work?
//    int fade = brightness + (thisPin * 85);
//    if(fade > (255 - (thisPin * 85))) {
//      fade = 255 - fade;
//    }
//    analogWrite(ledPins[thisPin], fade);
  }

  // for PWM and fade above
  brightness = brightness + fadeAmount;
  if (brightness == 0 || brightness == 255) {
    fadeAmount = -fadeAmount;
  }

  // flicker like candle
//  for (int thisPin = 0; thisPin < pinCount; thisPin++) {
//    if(random(5) == 1) {
//      analogWrite(ledPins[thisPin], random(200) + 150);
//    }
//  }

  // loop delay
  delay(30);
}
