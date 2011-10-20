import processing.opengl.*;

ArrayList<Float> posXbuffer;
ArrayList<Float> posYbuffer;

int fps = 60;
int followInterval = 5; //every nth frame
int counter = 0;
int readPosition = 0;
int fadeAmount = 5; //smaller means more trails

float posX1 = 0;
float posY1 = 0;
float posX2 = posX1;
float posY2 = posY1;

void setup() {
  size(640, 480, OPENGL);
  frameRate(fps);
  posXbuffer = new ArrayList();
  posYbuffer = new ArrayList();
  background(0);
}

void draw() {
  fill(0,fadeAmount);
  noStroke();
  rect(0,0,width,height);
  
  posX1 = mouseX;
  posY1 = mouseY;
  if(mouseX!=pmouseX||mouseY!=pmouseY){
  posXbuffer.add(posX1);
  posYbuffer.add(posY1);
  }

  if (counter<followInterval) {
    counter++;
  } else {
    counter=0;

    if(readPosition<posXbuffer.size()&&readPosition<posYbuffer.size()){
    posX2 = posXbuffer.get(readPosition);
    posY2 = posYbuffer.get(readPosition);
    readPosition++;
    }
  }
  
  fill(255, 0, 0);
  ellipse(posX1, posY1, 30, 30);
  fill(0, 255, 0, 100);
  ellipse(posX2, posY2, 30, 30);

}

