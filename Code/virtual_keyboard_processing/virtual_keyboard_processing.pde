/*
Code by Surya Penmetsa
p.surya1994@gmail.com
Let me know if you do something interesting with this code.
*/
import java.awt.Robot;
import java.awt.AWTException;
import java.awt.event.InputEvent;
import processing.serial.*; 
Serial myPort;
Robot mouse;

int x, xpos = 200, ypos = 200;
void setup()
{
  String portName=Serial.list()[0];
  myPort=new Serial(this,portName,9600);
  try
  {
    mouse = new Robot();
  }
  catch(AWTException e)
  {
    println("Robot not supprtd");
  }
  mouse.mouseMove(xpos,ypos);
}

void draw()
{
  while(myPort.available()>0)
  {
    x = myPort.read();
      if(x == '1') //front, to move to cursor front
       {
          ypos-=1;
          mouse.keyPress(KeyEvent.VK_UP);
       }
      else if(x == '2') //back, to move thre cursor back
      {
        ypos+=1;
        mouse.keyPress(KeyEvent.VK_DOWN);
      }
      else
      {
        mouse.keyRelease(KeyEvent.VK_UP);
        mouse.keyRelease(KeyEvent.VK_DOWN);
      }
    x = myPort.read();
      if(x == '3') //left, to move the cursor left
      {
        xpos-=1;
        mouse.keyPress(KeyEvent.VK_LEFT);
      }
      else if(x == '4') // right, to move the cursor right.
      {
        xpos+=1;
        mouse.keyPress(KeyEvent.VK_RIGHT);
        
      }
      else
      {
        mouse.keyRelease(KeyEvent.VK_LEFT);
        mouse.keyRelease(KeyEvent.VK_RIGHT);
      }
    
    
     
    //mouse.mouseMove(xpos,ypos);
  }

} 

