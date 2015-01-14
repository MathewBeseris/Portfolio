float i = 0;

void setup() {
  size(200, 200);
}

void draw() {
  background(255);
  float w = 200; 
  while (w > 0) {   
  stroke(0);
  
    if (i < 200){
     i++; 
    }
    if (i == 200){
     i = 0; 
    }
    
  fill((255/100)*((w+i)/2)); 
    
  ellipse(width/2, height/2, w, w);  
  w -= 20;
  }
}

