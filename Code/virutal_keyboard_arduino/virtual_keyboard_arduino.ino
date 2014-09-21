#include <MovingAvarageFilter.h> //Delete the spaces Between the header file while compiling

MovingAvarageFilter movingAvarageFilter(20);

MovingAvarageFilter movingAvarageFilter1(20);

MovingAvarageFilter movingAvarageFilter2(20);

MovingAvarageFilter movingAvarageFilter3(20);

void setup() {

Serial.begin(9600);
}

void loop() {

// declare input and output variables

float input = analogRead(0);

float input1 = analogRead(1);

float input2 = analogRead(2);

float input3 = analogRead(3);

float output = 0;

float output1 = 0;

float output2 = 0;

float output3 = 0;

output = movingAvarageFilter.process(input);

output1 = movingAvarageFilter1.process(input1);

output2 = movingAvarageFilter2.process(input2);

output3 = movingAvarageFilter3.process(input3);
/*Serial.print("  1  ");
Serial.println(output);
Serial.print("  2  ");
Serial.println(output1);
Serial.print("  3  ");
Serial.println(output2);
Serial.print("  4  ");
Serial.println(output3);
delay(100);
*/
if (output <600)
{
  Serial.println(1);
}
if (output1 <600)
{
  Serial.println(2);
}
 
if (output2 <600)
{
  Serial.println(3);
}
 if (output3 <600)
{
  Serial.println(4);
}

}