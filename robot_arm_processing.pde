import oscP5.*;                //  Load OSC P5 library
import netP5.*;                //  Load net P5 library
import processing.serial.*;    //  Load serial library

Serial arduinoPort;            //  Set arduinoPort as serial connection
OscP5 oscP5;                   //  Set oscP5 as OSC connection

int redLED = 0;                //  redLED lets us know if the LED is on or off
int [] led = new int [2];      //  Array allows us to add more toggle buttons in TouchOSC

void setup() {
  size(100,100);               // Processing screen size
  noStroke();            //  We don’t want an outline or Stroke on our graphics
    oscP5 = new OscP5(this,8000);  // Start oscP5, listening for incoming messages at port 8000
   arduinoPort = new Serial(this, Serial.list()[1], 9600);    // Set arduino to 9600 baud
   print("sauce");
   arduinoPort.write("l");
}

void oscEvent(OscMessage theOscMessage) {   //  This runs whenever there is a new OSC message

    String addr = theOscMessage.addrPattern();  //  Creates a string out of the OSC message
    println("Received ");
    print(addr);
    print(" from OSC IOS App");
    sendSerialMessage(addr.charAt(3));
    println("Sent ");
    print(addr.charAt(3));
    print(" to Arduino serial system");
    
}

void sendSerialMessage(char message) {
  
  arduinoPort.write(message);
  
}