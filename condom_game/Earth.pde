//////////////////////////////////////////////////// Earth class ///////////////////////////////////////////
class Earth {
  float posX, posY, rad, cR, cG, cB, speedX=random(-0.009, 0.009), speedY=random(-0.009, 0.009);
  PImage eggImg;
  int checkEgg=0;

  //have all functions run by one function
  Earth (float _x, float _y, float _r, float _cR, float _cG, float _cB, PImage _eggImg) {
    posX=_x;
    posY=_y;
    rad=_r;
    cR=_cR;
    cG= _cG;
    cB=_cB;
    eggImg= _eggImg;
  }

  void run() {
    create();
    test();
  }
  //create the earth
  void create() {
    noStroke();
    fill(20, 200, 255);//20, 200, 39

    //noFill();
    //strokeWeight(4);
    //stroke(random(255),random(150, 255),random(200, 255));
    image(eggImg, posX, posY);


    // ellipseMode(CENTER);
    //ellipse(posX, posY, rad*2, rad*2);
  }

  void test() {

    /////////////////////////////// Display images when hit by sperm ////////////////////////
    //enemies 1
    for (int i=0; i<enemyUnit; i++) {

      float d1 = dist(posX, posY, enemies1[i].posX, enemies1[i].posY);//distance between earth and enemies
      float d2 = dist(posX, posY, enemies2[i].posX, enemies2[i].posY);

      if (d1<69 && checkEgg==0 || d2<69 && checkEgg==0) {
        checkEgg=1;
        eggImg= loadImage("data/egg2.png");
      } else if (d1<69 && checkEgg==1 || d2<69 && checkEgg==1) {
        checkEgg=2;
        eggImg= loadImage("data/egg3.png");
      } else if (d1<69 && checkEgg==2 || d2<69 && checkEgg==2) {
        checkEgg=3;
        eggImg= loadImage("data/egg4.png");
      }
      if (checkEgg==3) {
        posX=posX+speedX;
        posY=posY+speedY;
      }
    }
  }
}