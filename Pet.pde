class Pet {
  PVector position;
  PVector velocity;
  PVector acc;
  PVector accToTarget;
  float size;
  float range;
  PVector target;


  Pet() {
    position = new PVector(550, 400);
    velocity = new PVector(5, 5);
    acc = new PVector(0, 0);
    range = 200;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  Enemy detectEnemy() {
    float minDist = width;
    Enemy winner = null;
    for (Enemy enemy : enemies) {
      float d = dist(enemy.position.x, enemy.position.y, position.x, position.y);
      if (d<enemy.d+range) {
        if (d<minDist) {
          winner=enemy;
          minDist=d;
        }
      }
    }
    //if (winner==null) {
    return winner;
  }


  void move() {
    //detectEnemy();
    Enemy detected = detectEnemy();
    if (detected==null) {
      target = player.position;
    } else {
      target = detected.position;
    }

    acc = PVector.sub(target, position);
    acc.normalize();
    acc.mult(0.3);
    // accToTarget = PVector.sub(target, position);  
    //accToTarget.setMag(0.1);
    //applyForce(accToTarget);

    //update velocity
    velocity.add(acc);
    velocity.limit(2.5);

    // Add the current speed to the location.
    position.add(velocity);
    acc.mult(0);
  }
  void display () {
    noFill();
    circle(position.x, position.y, size);
    image(petImage, position.x, position.y);

    //display range
    circle(position.x, position.y, range);
  }
}