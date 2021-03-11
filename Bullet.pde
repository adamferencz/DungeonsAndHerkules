class Bullet {
  PVector position, velocity, mouse;
  float d, angel;

  Bullet(PVector pos, float a) {
    d = 10; 
    angel = a;
    position = new PVector(pos.x, pos.y);
    mouse = new PVector(mouseX, mouseY);


    a = map(a, 0, 360, 0, TWO_PI);
    velocity = PVector.sub(mouse, position);
    velocity.rotate(a);
    velocity.setMag(10);
  }

  void display() {
    fill(0, 255, 255); 
    ellipse(position.x, position.y, d, d);
  }

  void move() {
    position.add(velocity);
  }

  boolean hit(PVector enemyPosition, float enemyD) {
    float far = dist(position.x, position.y, enemyPosition.x, enemyPosition.y);
    if (far < d/2 + enemyD/2) {
      return true;
    } else return false;
  }
  
  //todo despawn
}
