
void setup() {
  Serial.begin(9600);
  pinMode(4, INPUT);
  pinMode(5, INPUT);
  pinMode(6, INPUT);
  pinMode(7, INPUT);
  pinMode(8, INPUT);
  pinMode(9, INPUT);
  pinMode(10, INPUT);
  pinMode(11, INPUT);
  pinMode(12, INPUT);
  pinMode(13, INPUT);

}

void loop() {
  int button1 = digitalRead(12);
  int button2 = digitalRead(10);
  int button3 = digitalRead(9);
  int button4 = digitalRead(7);
  int button5 = digitalRead(5);
  int button6 = digitalRead(13);
  int button7 = digitalRead(11);
  int button8 = digitalRead(8);
  int button9 = digitalRead(6);
  int button10 = digitalRead(4);

  //int sensor3 = analogRead(A2);

  // keep this format
  Serial.print(button1);
  Serial.print(",");  
  Serial.print(button2);
  Serial.print(",");  
  Serial.print(button3);
  Serial.print(",");  
  Serial.print(button4);
  Serial.print(",");  
  Serial.print(button5);
  Serial.print(",");  
  Serial.print(button6);
  Serial.print(",");  
  Serial.print(button7);
  Serial.print(",");  
  Serial.print(button8);
  Serial.print(",");  
  Serial.print(button9);
  Serial.print(",");  
  Serial.print(button10);
  Serial.println(); // add linefeed after sending the last sensor value

  // too fast communication might cause some latency in Processing
  // this delay resolves the issue.
  delay(100);
}
