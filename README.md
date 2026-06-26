# Arduino-Based-Sonar-Radar-Visualization-System


A  **Arduino-Based-Sonar-Radar-Visualization-System** built using Arduino, ultrasonic sensor, and servo motor. The system scans the surroundings and displays real-time distance data in a radar-style interface using Processing.

---

##  Project Overview

This project simulates a basic radar system using:

- Ultrasonic sensor (HC-SR04) for distance measurement  
- Servo motor for 180° scanning motion  
- Arduino Uno for control and data processing  
- Processing IDE for real-time radar visualization  

The system detects objects within range and displays them on a graphical radar screen.

---

##  Components Used

- Arduino Uno  
- HC-SR04 Ultrasonic Sensor  
- Servo Motor (SG90)  
- Jumper Wires  
- USB Cable  
- Laptop with Arduino IDE + Processing IDE  

---

##  Software Used

- Arduino IDE  
- Processing IDE  

---

##  Working Principle

1. Servo motor rotates ultrasonic sensor from 15° to 165°  
2. Sensor measures distance using sound waves  
3. Arduino sends data as:angle,distance
4. Processing reads serial data  
5. Radar UI displays detected objects in real time  

---

#  Output

- Real-time radar sweep animation  
- Object detection within 40 cm range  
- Visual representation of surroundings  

---

##  How to Run

### Arduino
1. Open `.ino` file in Arduino IDE  
2. Upload to Arduino Uno  

### Processing
1. Open `.pde` file in Processing IDE  
2. Select correct COM port  
3. Run the sketch  

---

##  Learning Outcomes

- Basics of embedded systems  
- Sensor interfacing  
- Servo motor control  
- Serial communication  
- Data visualization techniques  

---


##  Future Improvements

- Add IoT monitoring  
- Increase scanning accuracy  
- Use ESP32 for wireless radar system  
- Machine learning-based object classification  

---
