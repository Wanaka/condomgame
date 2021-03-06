//text
PFont myFont;
PFont startEndFont;
String firstPage1 = "Stop the sperm!";
String firstPage2= "Interact with the condom through the touch board.";
//image
PImage condomImg;
PImage eggImg;
//Egg
Earth earth;
//controller
Controller controller;
//enemies
Enemy[] enemies1;
Enemy[] enemies2;
int enemyUnit=50;
//score
int counter;
boolean count= false;
//count down 
int begin; 
int duration;
int time;

void setup() {
  fullScreen();
  smooth();

  //start with fist page!
  noLoop();

  //text
  startEndFont = createFont("Calibri", 30);
  myFont = createFont("Calibri", 40);



  //image
  condomImg = loadImage("data/condom.png");
  eggImg= loadImage("data/egg1.png");


  //count down
  begin = millis();
  time = duration = 30;

  /////////////////////Create everything

  //earth
  earth=new Earth(width/2, height/2, 50, 253, 23, 233, eggImg);

  //controller
  controller = new Controller(30, condomImg);
  //enemies
  //enemies 1
  enemies1 = new Enemy[enemyUnit];
  for (int i=0; i<enemyUnit; i++) {
    enemies1[i]=new Enemy(random(width), -50/*random(height)*/, random(2, 10), random(1, 3), random(1, 3), earth.posX, earth.posY, random(TWO_PI), random(0.5, 1));
  }
  //enemies 2
  enemies2 = new Enemy[enemyUnit];
  for (int i=0; i<enemyUnit; i++) {
    enemies2[i]=new Enemy(random(width), random(height+20, height+50)/*random(height)*/, random(2, 10), random(1, 3), random(1, 3), earth.posX, earth.posY, random(TWO_PI), random(0.5, 1));
  }
}

void draw() {
  background(255, 192, 203);

  /////////////////////First text that appears!
  textFont(startEndFont);
  textAlign(LEFT);

  text(firstPage1, width/2-500, height/2-300);
  text(firstPage2, width/2-500, height/2-270);

  ////////////////////////// Count Down /////////////////////////////////////////////////////////////////////////////
  //text font and align for all other text on the page that comes after the starting text
  textFont(myFont);
  textAlign(CENTER, CENTER);
  //time counter
  if (time > 0)  time = duration - (millis() - begin)/1000;
  //background text
  fill(51);
  text(time, width-151, 46);
  //white official text!
  fill(248, 248, 248);
  text(time, width-150, 45);
  //Seconds
  //BG
  fill(51);

  text(" sec", width-101, 46);
  //white text
  fill(255, 153, 167);
  text(" sec", width-100, 45);

  //Run classes
  earth.run();
  controller.run();
  for (Enemy en : enemies1) {
    en.run();
  }
  for (Enemy en : enemies2) {
    en.run();
  }

  ////////////////////////// Counter ////////////////////////////////////////////////////////////////////////////////

  ///////////////////////////////////sperm

  //background sperm
  pushMatrix();
  //translate
  translate(109, 56);
  scale(0.5);
  rotate(PI/3-3);
  //ellipse of the sperm
  noStroke();
  fill(51);
  ellipseMode(CENTER);
  ellipse(0, 0, 30, 50);
  ellipse(0, 20, 15, 30);
  //tail
  noFill();
  stroke(51);
  strokeWeight(4);
  bezier(0, 30, 10, 50, 20, 50, 0, 70);
  popMatrix();

  ///pink sperm
  pushMatrix();
  //translate
  translate(110, 55);
  scale(0.5);
  rotate(PI/3-3);
  //ellipse of the sperm
  noStroke();
  fill(255, 153, 167);
  ellipseMode(CENTER);
  ellipse(0, 0, 30, 50);
  ellipse(0, 20, 15, 30);
  //tail
  noFill();
  stroke(255, 153, 167);
  strokeWeight(4);
  bezier(0, 30, 10, 50, 20, 50, 0, 70);
  popMatrix();

  ////sperm counter


  //bakground counter
  fill(51);
  text(counter, 69, 46);
  //white text
  fill(248, 248, 248);
  text(counter, 70, 45);

  //distance between controller and enemies

  //enemies 1
  for (int i=0; i<enemyUnit; i++) {

    float d2 = dist(mouseX, mouseY, enemies1[i].posX, enemies1[i].posY);//distance between controller and enemies

    if (d2<30) {
      enemies1[i].posXX= -100;
    }

    if (enemies1[i].posXX== -100) {
      counter++;
      enemies1[i].posXX=100;
    }
  }
  // enemies 2
  for (int i=0; i<enemyUnit; i++) {

    float d2 = dist(mouseX, mouseY, enemies2[i].posX, enemies2[i].posY);//distance between controller and enemies

    if (d2<30) {
      enemies2[i].posXX= -100;
    }

    if (enemies2[i].posXX== -100) {
      counter++;
      enemies2[i].posXX=100;
    }
  }
  //////////////////////// END Counter //////////////////////////
}//end draw

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}