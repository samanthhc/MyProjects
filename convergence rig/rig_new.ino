#define EN_PIN   2 //enable pin
#define STEP_PIN 3 //step pin
#define DIR_PIN  4 //direction pin
int L;
int I;
int D;
int S;


void setup() {
  // put your setup code here, to run once:
   pinMode(EN_PIN, OUTPUT);
  digitalWrite(EN_PIN, HIGH); //deactivate driver (LOW active)
  pinMode(DIR_PIN, OUTPUT);
  digitalWrite(DIR_PIN, HIGH);
  pinMode(STEP_PIN, OUTPUT);
  digitalWrite(STEP_PIN, LOW);

  digitalWrite(EN_PIN, LOW); //activate driver
  delay(100);
  
  while (!Serial);
  Serial.begin(9600);

}

void loop() 
{
  // put your main code here, to run repeatedly:


 if(Serial.available())
  {
   char c = Serial.read();
    if (c == 'G')
    {
      run();
    }
    else if(c == 'L')
    {
       L = Serial.parseInt();
    }
    else if(c == 'I')
    {
       I= Serial.parseInt();
    }
    else if(c== 'D')
    {
       D= Serial.parseInt();
    }
    
     else if(c == 'S')
    {
       S= Serial.parseInt();
    }
    
  }
 }
  
 void run()
  {
    int i;
    int j;
    int k;
    
    for(i = 0 ; i<L; i++)
    {
      digitalWrite(DIR_PIN, HIGH);
      for(j=0; j<I; j++)
      {
        for(k=0; k<9000/I; k++)
        {
          digitalWrite(STEP_PIN, HIGH);
           delayMicroseconds((-S+159.44)/0.2551); //wait 2ms
           digitalWrite(STEP_PIN, LOW);
           delayMicroseconds((-S+159.44)/0.2551); //wait 2ms
         }
         delay(D); //wait 500ms 
      }
      delay(100);
      digitalWrite(DIR_PIN, LOW);
      for(j=0; j<I; j++)
      {
        for(k=0; k<9000/I; k++)
        {
          digitalWrite(STEP_PIN, HIGH);
           delayMicroseconds((-S+159.44)/0.2551); //wait 2ms
           digitalWrite(STEP_PIN, LOW);
           delayMicroseconds((-S+159.44)/0.2551); //wait 2ms
         }
         delay(D); //wait 500ms 
      }
      
    }
  }
      
