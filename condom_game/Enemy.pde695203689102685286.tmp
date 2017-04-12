////////////////////////////////////////////////////// Enemy class ///////////////////////////////////////////
class Enemy {
  float posX, posY, rad, speedX, speedY, dirX, dirY, earthPosX, earthPosY, posXX, rotate, sca;
  int counter=0;

  Enemy (float _x, float _y, float _r, float _speedX, float _speedY, float _earthPosX, float _earthPosY, float _rotate, float _sca) {
    posXX=random(width);
    posX=_x;
    posY=_y;
    rad=_r;
    speedX=_speedX;//speed and dir has to be var otherwise they dont move
    speedY=_speedY;
    dirX=1;
    dirY=1;
    earthPosX= _earthPosX;
    earthPosY=_earthPosY;
    rotate=_rotate;
    sca=_sca;
  }

  //have all functions run by one function
  void run() {
    create();
    move();
    bounce();
    collision();
  }
  //create enemy
  void create() {
    ///////////////////////////////////sperm
    pushMatrix();
    //translate Rotate Scale
    translate(posX, posY);
    rotate(rotate);
    rotate(random(0.1, 0.4));
    scale(sca);

    //ellipse of the sperm
    noStroke();
    fill(248, 248, 248);
    ellipseMode(CENTER);
    ellipse(0, 0, 30, 50);
    ellipse(0, 20, 15, 30);

    //tail
    noFill();
    stroke(248, 248, 248);
    strokeWeight(4);
    bezier(0, 30, 10, 50, 20, 50, 0, 70);
    popMatrix();
    ////////////////////////////END sperm

    //ellipse
    noFill();
    noStroke();
    ellipseMode(CENTER);
    ellipse(posX, posY, rad*2, rad*2);
  }
  //create movement
  void move() {
    posX+= + (speedX*dirX);
    posY+= + (speedY*dirY);
  }

  //create bounce
  void bounce() {
    float b=50;
    if (posX>width+b || posX<-b) {
      dirX=-dirX;
    }
    if (posY>height+b || posY<-b) {
      dirY=-dirY;
      //you dont want to make it change dir....
      //change pos and make it go in different dir.
      // dirY*=-dirY;
    }
  }
  //make the earth collide with enemies
  void collision() {

    float d1 = dist(posX, posY, earthPosX, earthPosY);//distance between earth and enemies

    if (d1<68) {
      posX= -100;
      posY=-100;
      speedX=0;
      speedY=0;
    }

    ///////////////////////controller

    float d2 = dist(mouseX, mouseY, posX, posY);//distance between controller and enemies - BIG
    float d3 = dist(mouseX, mouseY-40, posX, posY);//distance between controller and enemies - SMALL TOP
    float d4 = dist(mouseX, mouseY+45, posX, posY);//distance between controller and enemies
    //small rings on bottom of the condom!!
    float dSmall1 = dist(mouseX-55, mouseY+50, posX, posY);//distance between controller and enemies
    float dSmall2 = dist(mouseX-35, mouseY+50, posX, posY);//distance between controller and enemies
    float dSmall3 = dist(mouseX-15, mouseY+50, posX, posY);//distance between controller and enemies
    float dSmall4 = dist(mouseX, mouseY+50, posX, posY);//distance between controller and enemies
    float dSmall5 = dist(mouseX+15, mouseY+50, posX, posY);//distance between controller and enemies
    float dSmall6 = dist(mouseX+35, mouseY+50, posX, posY);//distance between controller and enemies
    float dSmall7 = dist(mouseX+55, mouseY+50, posX, posY);//distance between controller and enemies


    if (d2<39 || d3<20 || d4<20 || dSmall1<10 || dSmall2<10 || dSmall3<10 || dSmall4<10 || dSmall5<10 || dSmall6<10 || dSmall7<10) {
      posXX= -100;
      posY=-100;
      speedX=0;
      speedY=0;
    }
  }
}