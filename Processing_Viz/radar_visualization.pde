import processing.serial.*;
import java.util.ArrayList;

Serial port;
int angle = 0;
int distance = 0;

int centerX, centerY;
int radius = 250;

ArrayList<Detection> detections = new ArrayList<Detection>();

void setup() {
  size(600, 600);
  background(0);
  centerX = width / 2;
  centerY = height;
  smooth();

  String portName = "COM7"; // Change to match your COM port
  port = new Serial(this, portName, 9600);
  port.bufferUntil('\n');
}

void draw() {
  background(0);
  drawRadarGrid();
  drawDetections();
  drawSweepLine();
}

void drawRadarGrid() {
  stroke(0, 255, 0, 100);
  noFill();

  // Arcs
  for (int r = 50; r <= radius; r += 50) {
    arc(centerX, centerY, r * 2, r * 2, PI, TWO_PI);
  }

  // Angle lines
  for (int a = 15; a <= 165; a += 15) {
    float rad = radians(a);
    float x = centerX - radius * cos(rad);
    float y = centerY - radius * sin(rad);
    line(centerX, centerY, x, y);
  }
}

void drawSweepLine() {
  float rad = radians(angle);
  float x = centerX - radius * cos(rad);
  float y = centerY - radius * sin(rad);

  stroke(0, 255, 0);
  strokeWeight(2);
  line(centerX, centerY, x, y);
}

void drawDetections() {
  for (int i = detections.size() - 1; i >= 0; i--) {
    Detection d = detections.get(i);
    d.display();
    d.fade();
    if (d.alpha <= 0) {
      detections.remove(i);
    }
  }

  // Display angle and distance below the radar
  fill(0, 255, 0);
  textAlign(CENTER);
  textSize(16);
  text("Angle: " + angle + "°   Distance: " + distance + " cm", width / 2, height - 20);
}

void serialEvent(Serial port) {
  String data = port.readStringUntil('\n');
  if (data != null) {
    data = trim(data);
    String[] parts = split(data, ',');
    if (parts.length == 2) {
      angle = int(parts[0]);
      distance = int(parts[1]);

      if (distance > 0 && distance <= 40) {
        detections.add(new Detection(angle, distance));
      }
    }
  }
}

// Detection Class with fading
class Detection {
  int angle;
  float distance;
  int alpha = 255;

  Detection(int angle, float cm) {
    this.angle = angle;
    this.distance = map(cm, 0, 40, 0, radius);
  }

  void display() {
    float rad = radians(angle);
    float x = centerX - distance * cos(rad);
    float y = centerY - distance * sin(rad);

    fill(255, 0, 0, alpha);
    noStroke();
    ellipse(x, y, 10, 10);
  }

  void fade() {
    alpha -= 5;
  }
}
