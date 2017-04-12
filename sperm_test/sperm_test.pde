
void setup() {
  size(200, 200);

  //translate Rotate Scale
  translate(width/2, height/2);
  rotate(random(TWO_PI));
  scale(random(0.5, 1));
  //ellipse of the sperm
  noStroke();
  ellipseMode(CENTER);
  ellipse(0, 0, 30, 50);
  ellipse(0, 20, 15, 30);
  //tail
  noFill();
  stroke(255);
  strokeWeight(4);
  bezier(0, 30, 10, 50, 20, 50, 0, 70);
}