
Button buttonList[] = new Button[10];
Button operatorList[] = new Button[16];
int operatorNumber;


String value1 = "";
char operator;
String value2 = "";
float result = 0;

int currentOperator = 1;



void setup() {
  stroke(1);
  size(230, 240);
  buttonList[0] = new Button(70, 140, 40, 20, color(55,242,255), "0", true);
  buttonList[1] = new Button(20, 50, 40, 20, color(55,242,0), "1", true);
  buttonList[2] = new Button(70, 50, 40, 20, color(55,242,30), "2", true);
  buttonList[3] = new Button(120, 50, 40, 20, color(55,242,60), "3", true);
  buttonList[4] = new Button(20, 80, 40, 20, color(55,242,90), "4", true);
  buttonList[5] = new Button(70, 80, 40, 20, color(55,242,120), "5", true);
  buttonList[6] = new Button(120, 80, 40, 20, color(55,242,150), "6", true);
  buttonList[7] = new Button(20, 110, 40, 20, color(55,242,180), "7", true);
  buttonList[8] = new Button(70, 110, 40, 20, color(55,242,210), "8", true);
  buttonList[9] = new Button(120, 110, 40, 20, color(55,242,240), "9", true);

  operatorList[0] = new Button(20, 140, 30, 20, color(250,138,0), '±', false, true); // ±
  operatorList[1] = new Button(130, 140, 30, 20, color(250,138,0), '.', false, true);// .
  operatorList[2] = new Button(20, 170, 30, 20, color(250,138,0), '+', false, false);// +
  operatorList[3] = new Button(60, 170, 30, 20, color(250,138,0), '-', false, false);// -
  operatorList[4] = new Button(100, 170, 30, 20, color(250,138,0), 'x', false, false); // *
  operatorList[5] = new Button(140, 170, 30, 20, color(250,138,0), '÷', false, false);// /
  operatorList[6] = new Button(180, 170, 30, 50, color(250,138,0), '=', false, true);// =
  operatorList[7] = new Button(140, 200, 30, 20, color(250,138,0), 'C', false, true);// c

  operatorList[8] = new Button(180, 50, 30, 20, color(250,61,69), "sin", false, true);
  operatorList[9] = new Button(180, 80, 30, 20, color(250,61,69), "cos", false, true);
  operatorList[10] = new Button(180, 110, 30, 20, color(250,61,69), "tan", false, true);
  operatorList[11] = new Button(180, 140, 30, 20, color(250,61,69), '%', false, true);
  operatorList[12] = new Button(20, 200, 20, 20, color(250,61,69), '√', false, true);
  operatorList[13] = new Button(50, 200, 20, 20, color(250,61,69), '²', false, true);
  operatorList[14] = new Button(80, 200, 20, 20, color(random(256),random(256),random(256)), '~', false, true);
  operatorList[15] = new Button(110, 200, 20, 20, color(250,61,69), "log", false, true);
}

void draw() {

  //println(currentOperator);



  background(255);
  stroke(10);
  fill(2);
  rect(10, 10, 210, 220, 10);
  fill(206);
  rect(20, 20, 190, 20, 3);
  for (int i = 0; i < buttonList.length; i ++) {
    buttonList[i].display();
    buttonList[i].on = false;
  }
  for (int i = 0; i < operatorList.length; i ++) {
    operatorList[i].display();
    operatorList[i].on = false;
  }


  if (currentOperator == 1) {
    text(value1, 22, 35);
  }
  if (currentOperator == 2) {
    text(value1, 22, 35);
    text(operator, 200, 35);
  }
  if (currentOperator == 3) {
    text(value2, 22, 35);
  }
  if (currentOperator == 4) {
    text(value1, 22, 35);
  }
}

void mousePressed() {
  for (int i = 0; i < buttonList.length; i ++) {
    buttonList[i].pressNum();
  }
  for (int i = 0; i < operatorList.length; i ++) {
    operatorList[i].pressOp();
  }
}


void keyPressed() {


  if (currentOperator == 1 && key != '/' && key != '*' && key != '-' && key != '+' && key != ENTER) {
    value1 += key;
  }

  if (currentOperator == 3 && key != '/' && key != '*' && key != '-' && key != '+' && key != ENTER) {
    value2 += key;
  }
  if (currentOperator == 2 && key != '/' && key != '*' && key != '-' && key != '+' && key != ENTER) {
    value2 += key;
    currentOperator = 3;
  }

  if (value1 != "" && currentOperator == 1 && (key == '/' || key == '*' || key == '-' || key == '+' || key == ENTER)) {
    if (key == '*')
      key = 'x';
    if (key == '/')
      key = '÷';

    operator = key;
    currentOperator = 2;
  }
     if (key == ENTER && value2 != "") {
      if (operator == '+') {
        result = Float.valueOf(value1).floatValue() + Float.valueOf(value2).floatValue();
      }
      if (operator == '-') {
        result = float(value1) - float(value2);
      }
      if (operator == 'x') {
        result = float(value1) * float(value2);
      }
      if (operator == '÷') {
        result = float(value1) / float(value2);
      }

      value1 = str(result);
      //value2 = "";
      //operator = '\0';
      result = 0;
      currentOperator = 1;
    }
    
  if (key == 'c') {
    value1 = "";
    value2 = "";
    operator = '\0';
    result = 0;
    currentOperator = 1;
  }
}




class Button {
  float x;
  float y;
  float w;
  float h;
  boolean on;
  color bColor;
  String bNum;
  char bChar;
  boolean isNumber;
  boolean isSpecial;
  String spChar;

  Button(float tempX, float tempY, float tempW, float tempH, color tempColor, 
  String tempNum, boolean tempNumber) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    on = false;
    bColor = tempColor;
    bNum = tempNum;
    isNumber = tempNumber;
  }

  Button(float tempX, float tempY, float tempW, float tempH, color tempColor, 
  char tempChar, boolean tempNumber, boolean tempSpecial) {
  
    spChar = "";
    bChar = tempChar;
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    on = false;
    bColor = tempColor;
    isNumber = tempNumber;
    isSpecial = tempSpecial;
  }

  Button(float tempX, float tempY, float tempW, float tempH, color tempColor, 
  String tempChar, boolean tempNumber, boolean tempSpecial) {

    spChar = tempChar;
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    on = false;
    bColor = tempColor;
    isNumber = tempNumber;
    isSpecial = tempSpecial;

  }


  void pressNum() {
    if (mouseX > x && mouseX < (w+x) && mouseY > y && mouseY < (h+y)) {
      if (currentOperator == 1) {
        value1 += bNum;
      }
      if (currentOperator == 3) {
        value2 += bNum;
      }
      if (currentOperator == 2) {
        value2 = "";
        value2 += bNum;
        currentOperator = 3;
      }
      on = true;
    }
  }

  void pressOp() {
    if (mouseX > x && mouseX < (w+x) && mouseY > y && mouseY < (h+y)) {
      if (value1 != "" && currentOperator == 1 && isSpecial == false) {
        operator = bChar;
        on = true;
        currentOperator = 2;
      }

      if (isSpecial == true) {
        //operator = bChar;
        on = true;
        

        if (bChar == 'C') { //Clear
          value1 = "";
          value2 = "";
          operator = '\0';
          result = 0;
          currentOperator = 1;
        }
        
        if (bChar == '±') { //Positive Negative
          if (currentOperator == 1) {
            value1 = str(float(value1)*(-1));
          }
          if (currentOperator == 3) {
            value2 = str(float(value2)*(-1));
          }
        }

        if (bChar == '=' && value2 != "") { //Equals
          if (operator == '+') {
            result = Float.valueOf(value1).floatValue() + Float.valueOf(value2).floatValue();
          }
          if (operator == '-') {
            result = float(value1) - float(value2);
          }
          if (operator == 'x') {
            result = float(value1) * float(value2);
          }
          if (operator == '÷') {
            result = float(value1) / float(value2);
          }
          
          value1 = str(result);
          //value2 = "";
          //operator = '\0';
          result = 0;
          currentOperator = 1;
        }
        if(spChar == "sin"){
          
          if(currentOperator == 1){
            value1 = str(sin(float(value1)));
          }
          if(currentOperator == 3){
            value2 = str(sin(float(value2)));
          }
        }
        
        if(spChar == "cos"){
          if(currentOperator == 1){
            value1 = str(cos(float(value1)));
          }
          if(currentOperator == 3){
            value2 = str(cos(float(value2)));
          }
        }
        
        if(spChar == "tan"){
          if(currentOperator == 1){
            value1 = str(tan(float(value1)));
          }
          if(currentOperator == 3){
            value2 = str(tan(float(value2)));
          }
        }
       
       if (bChar == '%'){
          if(currentOperator == 1){
            value1 = (str( (float(value1)) * .01));
          }
          if(currentOperator == 3){
            value2 = (str( (float(value2)) * .01));
          }
       }
       
       if(bChar == '√'){
         if(currentOperator == 1){
            value1 = str(sqrt(float(value1)));
          }
          if(currentOperator == 3){
            value2 = str(sqrt(float(value2)));
          }
       }
       
       if(bChar == '²'){
         if(currentOperator == 1){
            value1 = str(sq(float(value1)));
          }
          if(currentOperator == 3){
            value2 = str(sq(float(value2)));
          }
       } 
       
         if(bChar == '.'){
          if(currentOperator == 1){
            value1 += ".";
          }
          if(currentOperator == 3){
            value2 += ".";
          }
        }
        
        if(bChar == '~'){
          if(currentOperator == 1){
            value1 = str(random(0,101));
          }
          if(currentOperator == 3){
            value2 = str(random(0,101));
          }
        }
        
        if(spChar == "log"){
          if(currentOperator == 1){
            value1 = str(log(float(value1)));
          }
          if(currentOperator == 3){
            value2 = str(log(float(value2)));
          }
        }
      }
    }
  }



  void display() {
    if (on == true) {
      fill(255);
    } else {
      fill(bColor);
    }
    rect(x, y, w, h, 5);
    fill(0);

    if (isNumber) {
      text((bNum), x+(w/2)-5, y+(h/2)+4);
    }
    if (!isNumber) {
      text((bChar), x+(w/2)-5, y+(h/2)+4);
    }
    if(isSpecial){
      text((spChar), x+(w/2)-8, y+(h/2)+4);
    }
  }
}


