class Enemy {
  PVector position;
  PVector velocity;
  PVector acc;
  PVector accToTarget;
  float r;
  color c;

  Enemy(PVector origin) {
    position = origin;
    velocity = new PVector(2.5, 5);
    acc = new PVector(0, 0);
    r = 16;
    c = #FF2E4E;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void update(PVector target) {
    //get accToTarget
    accToTarget = PVector.sub(target, position);  
    accToTarget.setMag(0.1);
    applyForce(accToTarget);

    //update velocity
    velocity.add(acc);
    velocity.limit(2);

    // Add the current speed to the location.
    position.add(velocity);
    acc.mult(0);
  }

  void display() {

    stroke(0);
    fill(c);
    ellipse(position.x, position.y, r, r);

    //image
    image(enemyImage, position.x, position.y);
  }
}
