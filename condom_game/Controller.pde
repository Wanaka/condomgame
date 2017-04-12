//////////////////////////////////////////////////////// Controller class ///////////////////////////////////////////
class Controller {
  float rad;
  PImage condomImg;

  Controller(float _r, PImage _condomImg) {
    rad=_r;
    condomImg =_condomImg;
  }

  void run() {
    create();
  }

  void create() {
    noCursor();
    noFill();
    noStroke();
    //images
    imageMode(CENTER);
    image(condomImg, mouseX, mouseY);
    ellipseMode(CENTER);
    //small top ellipse
    ellipse(mouseX, mouseY-40, 25, 30);
    //big center ellipse
    ellipse(mouseX, mouseY, rad*2, rad*2);
    //left bottom ellipse
    ellipse(mouseX-55, mouseY+50, 20, 20);
    //left+1 bottom ellipse
    ellipse(mouseX-35, mouseY+50, 20, 20);
    //left+2 bottom ellipse
    ellipse(mouseX-15, mouseY+50, 20, 20);
    //middle bottom ellipse
    ellipse(mouseX, mouseY+50, 20, 20);
    //middle+1 bottom ellipse
    ellipse(mouseX+15, mouseY+50, 20, 20);
    //middle+2 bottom ellipse
    ellipse(mouseX+35, mouseY+50, 20, 20);
    //middle+3 bottom ellipse
    ellipse(mouseX+55, mouseY+50, 20, 20);
  }
}