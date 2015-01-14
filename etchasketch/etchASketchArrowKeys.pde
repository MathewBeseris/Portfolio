int x, y;


boolean key1 = false;

int loop = 0;

void setup() {
  size(400, 400);
  frameRate(30);
  // Set start coords
  x = 0;
  y = 0;

  frameRate(1);
}

void draw() {
  
}


void keyPressed() {
  stroke(0);
  if (key == 'w') {
    moveUp(1);
  }
  else if (key == 's') {
    moveDown(1);
  }
  else if (key == 'a') {
    moveLeft(1);
  }
  else if (key == 'd') {
    moveRight(1);
  }
  else if (key == 'e') {
    moveTR(1);
  }
  else if (key == 'c') {
    moveBR(1);
  }
  else if (key == 'q') {
    moveTL(1);
  }
  else if (key == 'z') {
    moveBL(1);
  }

  else if (key == 'x') {
    x = mouseX;
    y = mouseY;
  }
}




// Draw UDLR lines
void moveRight(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x+i, y);
  }
  x=x+(10*rep);
}

void moveLeft(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x-i, y);
  }
  x=x-(10*rep);
}

void moveUp(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x, y-i);
  }
  y=y-(10*rep);
}

void moveDown(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x, y+i);
  }
  y=y+(10*rep);
}



//Diagonal Movements

void moveTR(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x+i, y-i);
  }
  x=x+(10*rep);
  y=y-(10*rep);
}

void moveTL(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x-i, y-i);
  }
  x=x-(10*rep);
  y=y-(10*rep);
}

void moveBL(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x-i, y+i);
  }
  x=x-(10*rep);
  y=y+(10*rep);
}

void moveBR(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x+i, y+i);
  }
  x=x+(10*rep);
  y=y+(10*rep);
}



void mouseClicked() {
  saveFrame("picture-#####.png");
}


