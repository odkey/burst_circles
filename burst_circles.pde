Circle[] circles = new Circle[50];

void setup() {
  size(600, 600);
  noCursor();
  for (int i = 0; i < circles.length; i++) {
    circles[i] = new Circle(random(400), random(400));
    circles[i].setAmpOffset(0.1);
  }
}

void draw() {
  background(#ffffff);
   
  for (int i = 0; i < circles.length; i++) {
    circles[i].update();
    circles[i].draw();
  }
  if (random(1) < 0.02 && dist(mouseX, mouseY, pmouseX, pmouseY) == 0) {
    randomize();
  }
}

void mousePressed() {
  randomize();
}

void randomize() {
  for (int i = 0; i < circles.length; i++) {
    PVector additional_acc = new PVector(random(-30, 30), random(-30, 30));
    circles[i].addVel(additional_acc);
  }
}