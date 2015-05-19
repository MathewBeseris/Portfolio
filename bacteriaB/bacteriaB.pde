boolean spot = false;
int x;
int y;
int r = 10;
PImage bg;


void setup(){
    size(1280,720);
    bg = loadImage("Environment1.png");
    image(bg,0,0);
    strokeWeight(5);
}

void draw(){
    if(spot == true){
       bacteriaSpot(); 
    }
}

void bacteriaSpot(){
   point(x+random(r)-r/2,y+random(r)-r/2);
   r++;
}

void mousePressed(){
  x= mouseX;
  y= mouseY;
  r = 10;
  spot = true;
}


