#define EN_PIN   2 //enable pin
#define STEP_PIN 3 //step pin
#define DIR_PIN  4 //direction pin

//Note: You also have to connect GND and 5V from the Arduino to the SilentStepStick.
//      A connection diagram can be found in the schematics.

void setup()
{
  pinMode(EN_PIN, OUTPUT);
  digitalWrite(EN_PIN, HIGH); //deactivate driver (LOW active)
  pinMode(DIR_PIN, OUTPUT);
  digitalWrite(DIR_PIN, LOW);
  pinMode(STEP_PIN, OUTPUT);
  digitalWrite(STEP_PIN, LOW);

  digitalWrite(EN_PIN, LOW); //activate driver
  delay(100);
  
  while (!Serial);
  Serial.begin(9600);
 

}

void loop()
{
   int i;
  
    if(Serial.available())
  {
   char c = Serial.read();
    if (c == 'f')
     {
        digitalWrite(DIR_PIN, LOW); //set the direction: low
        int m = Serial.parseInt();
        for(i=0; i<m; i++) //iterate for m steps
         {
           digitalWrite(STEP_PIN, LOW);
           delayMicroseconds(500); //wait 2ms
           digitalWrite(STEP_PIN, HIGH);
           delayMicroseconds(500); //wait 2ms
         }
        
       }
         delay(500); //wait 500ms 
      
     if(c == 'b')
     {
          digitalWrite(DIR_PIN, HIGH); //set the direction: high
          int m = Serial.parseInt();
          for(i=0; i<m; i++) //iterate for m steps
           {
             digitalWrite(STEP_PIN, LOW);
             delayMicroseconds(500); //wait 2ms
             digitalWrite(STEP_PIN, HIGH);
             delayMicroseconds(500); //wait 2ms
            }
     }
           delay(500); //wait 500ms
   }
}
