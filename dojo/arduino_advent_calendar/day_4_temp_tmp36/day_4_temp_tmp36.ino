const int temperaturePin = A1;

void setup() {
  Serial.begin(9600);
}

void loop() {
  float voltage, degreesC, degreesF;

  voltage = getVoltage(temperaturePin);

  degreesC = (voltage - 0.5) * 100.0;       // volt to degrees C conversion
  degreesF = degreesC * (9.0 / 5.0) +32.0;  // convert to Farenheigt

  Serial.print("voltage: ");
  Serial.print(voltage);
  Serial.print(" deg C: ");
  Serial.print(degreesC);
  Serial.print(" deg F: ");
  Serial.println(degreesF);

  delay(1000);
}

float getVoltage(int pin) {
  return (analogRead(pin) * 0.004882814);
  // convert 0 to 1023 value from analogRead() into a 0.0 - 5.0 voltage
}

