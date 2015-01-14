
int direction;

Car[] myCars = new Car[100];



void setup(){
  size(600,600);
  frameRate(60);
  for(int i = 0; i < myCars.length; i++){
    direction = int(random(-1,2));
    if(direction == 0){
     direction -= 1;
    }
    myCars[i] =new Car(int(random(20,580)),int(random(20,580)),direction*int(random(1,12)),color(random(255),random(255),random(255)), int(random(10,25)), int(random(5,25)),(random(-1,1) < 0.5),(random(-1,1) < 0.5));
  }
}

void draw(){
  background(200);
  for(int i = 0; i < myCars.length; i++){
   myCars[i].drive();
   myCars[i].display(); 
   println(int(random(-1,2)));
  }
}




class Car{
  //member variables
  int cLength, cHeight, cSpeed;
  float xpos, ypos;
  color cColor;
  boolean cTire, cAntenna;
  
  //constructor1
  Car(float tempX, float tempY){
    xpos = tempX;
    ypos = tempY;
    cSpeed = 5;
    cColor = color(12,175,100);
    cLength = 20;
    cHeight = 10;
    cTire = true;
    cAntenna = true;
  }
  
  //constructor2
  Car(int tempX, int tempY, int tempSpeed, color tempColor, int tempLength, int tempHeight, boolean tempTire, boolean tempAntenna){
    xpos = tempX;
    ypos = tempY;
    cSpeed = tempSpeed;
    cColor = tempColor;
    cLength = tempLength;
    cHeight = tempHeight;
    cTire = tempTire;
    cAntenna = tempAntenna;
  }


//member methods
  void display(){
    rectMode(CENTER);
    //noStroke();
    fill(cColor);
    rect(xpos,ypos, cLength, cHeight);
    
    if(cTire){
      fill(0);
      ellipse(xpos-cLength/2,cHeight/2+ypos,5,5);
      ellipse(xpos+cLength/2,cHeight/2+ypos,5,5);
    }
    
    if(cAntenna && cSpeed <= 0){
      line((xpos+cLength/2)-4,ypos-(cHeight/2),(xpos+cLength/2)+3,(ypos-(cHeight/2))-5); 
    }
    if(cAntenna && cSpeed >= 0){
      line((xpos-cLength/2)+4,ypos-(cHeight/2),(xpos-cLength/2)-3,(ypos-(cHeight/2))-5); 
    }
  }
  
  void drive(){
    xpos += cSpeed;
    if(xpos > width){
      xpos = 0;
      ypos = random(20,580);
      cColor = color(random(255),random(255),random(255));
      cTire = (random(-1,1) < 0.5);
    }
    if(xpos < 0){
     xpos = width;
     ypos = random(20,580); 
     cColor = color(random(255),random(255),random(255));
     cTire = (random(-1,1) < 0.5);
    }
  }
}

