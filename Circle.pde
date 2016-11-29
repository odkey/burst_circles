
class Circle {
  private PVector mouse, pos, vel, acc;
  private float radius, diameter;
  private float amp_offset;
  private color fill_color, stroke_color;
  private boolean strokeTransparent, fillTransparent;

  Circle(float px, float py) {
    mouse = new PVector(mouseX, mouseY);
    pos = new PVector(px, py);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    amp_offset = 0.1;
    stroke_color = color(0, 0, 0, 255);
    fill_color = color(0, 0, 0, 120);
    strokeTransparent = true;
    fillTransparent = false;
  }
  void setAmpOffset(float _amp_offset) {
    amp_offset = _amp_offset;
  }
  
  public void setStrokeTransparent(boolean _transparent) {
    strokeTransparent = _transparent;
  }
  
  public void setFillTransparent(boolean _transparent) {
    fillTransparent = _transparent;
  }
  
  public void update() {
    updateStatus();
    updateMotion();
    updateShape();
  }
  
  public void draw() {
    if (!strokeTransparent) {
      stroke(stroke_color);
    }
    else {
      noStroke();
    }
    if (!fillTransparent) {
      fill(fill_color);
    }
    else {
      noFill();
    }
    ellipse(pos.x, pos.y, diameter, diameter);
  }
  
  public void addVel(PVector _acc) {
    vel.add(_acc);
  }
  
  private void updateStatus() {
    mouse.set(mouseX, mouseY);
  }
  
  private void updateMotion() {
    acc = mouse.sub(pos).mult(random(1));
    vel.add(acc.mult(0.1));
    if (vel.mag() > 1) {
      pos.add(vel.mult(0.9));
    }
  }
  
  private void updateShape() {
    radius = amp_offset * dist(pos.x, pos.y, mouseX, mouseY);
    diameter = radius * 2 + 1;
  }
}