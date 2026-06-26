#include <Servo.h>

const int servoPin = 9;
const int trigPin = 7;
const int echoPin = 6;

Servo radarServo;

int angle = 15;
int step = 1;
unsigned long lastUpdate = 0;
const unsigned long interval = 100; // 0.1 sec

void setup() {
  Serial.begin(9600);
  radarServo.attach(servoPin);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
}

void loop() {
  unsigned long currentTime = millis();
  if (currentTime - lastUpdate >= interval) {
    lastUpdate = currentTime;

    radarServo.write(angle);
    delay(10); // Short pause for stability

    long distance = getDistance();

    Serial.print(angle);
    Serial.print(",");
    Serial.println(distance);

    angle += step;
    if (angle >= 165 || angle <= 15) {
      step = -step;
    }
  }
}

long getDistance() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  long duration = pulseIn(echoPin, HIGH, 25000);
  if (duration == 0) return 0;
  return duration * 0.034 / 2;
}
