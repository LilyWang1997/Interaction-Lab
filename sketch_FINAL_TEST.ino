int Weight1 = 0;
int Weight2 = 0;
int Weight3 = 0;
int Weight4 = 0;
int WEIGHT = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
    pinMode(2, OUTPUT);
    pinMode(3, OUTPUT); 
    pinMode(4, OUTPUT);
    pinMode(5, OUTPUT); 
    pinMode(7, OUTPUT);
    pinMode(8, OUTPUT); 
    pinMode(11, OUTPUT);
    pinMode(12, OUTPUT); 
}

void loop() {
  // put your main code here, to run repeatedly:
// MOTOR 1    
     digitalWrite(2, 50);
     digitalWrite(3, LOW);
     delay(100); 
    
     digitalWrite(2, LOW);
     digitalWrite(3, LOW);
     delay(400);  
         
     digitalWrite(3, 50);
     digitalWrite(2, LOW);
     delay(100); 
     
     digitalWrite(2, LOW);
     digitalWrite(3, LOW);
     delay(400); 
     

// MOTOR 2
     //digitalWrite(4, 50);
     //digitalWrite(5, LOW);
     //delay(400); 
    
     digitalWrite(4, LOW);
     digitalWrite(5, LOW);
     delay(400);  
     
     
     
     //digitalWrite(5, 50);
     //digitalWrite(4, LOW);
     //delay(700); 
     
     digitalWrite(4, LOW);
     digitalWrite(5, LOW);
     delay(400); 


 // MOTOR 3
     digitalWrite(7, 50);
     digitalWrite(8, LOW);
     delay(300); 
    
     digitalWrite(7, LOW);
     digitalWrite(8, LOW);
     delay(400);  
     
     
     
     digitalWrite(8, 50);
     digitalWrite(7, LOW);
     delay(300); 
     
     digitalWrite(7, LOW);
     digitalWrite(8, LOW);
     delay(400); 


// MOTOR 4
     digitalWrite(11, 50);
     digitalWrite(12, LOW);
     delay(1000); 
    
     digitalWrite(11, LOW);
     digitalWrite(12, LOW);
     delay(400);  
     
     digitalWrite(12, 50);
     digitalWrite(11, LOW);
     delay(1000); 
     
     digitalWrite(11, LOW);
     digitalWrite(12, LOW);
     delay(400); 

// IF
     Weight1 = analogRead(A0);
     Weight2 = analogRead(A2);
     Weight3 = analogRead(A3);
     Weight4 = analogRead(A4);

//     WEIGHT = Weight1 + Weight2 + Weight3 + Weight4;

     if (Weight1 == 0 || Weight2 == 0 || Weight3 == 0 || Weight4 == 0){ 
     digitalWrite(3, HIGH);
     digitalWrite(2, LOW);
     delay(100); 
     }
}
     //if((Weight1 == 0 && Weight2 == 0) % (Weight1 == 0 && Weight3 == 0) % (Weight1 == 0 && Weight4 == 0) % (Weight2 == 0 && Weight3 == 0{
    //  % Weight2 == 0 % Weight3 == 0 % Weight4 == 0)
      
 
