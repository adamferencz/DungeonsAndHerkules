class Bullet {
  PVector position, velocity, mouse;
  float d, angel, damage;

  Bullet(PVector pos, float a) {
    d = 10; 
    angel = a;
    position = new PVector(pos.x, pos.y);
    mouse = new PVector(mouseX, mouseY);


    a = map(a, 0, 360, 0, TWO_PI);
    velocity = PVector.sub(mouse, position);
    velocity.rotate(a);
    velocity.setMag(10);
    damage = 1;
  }


  void display() {
    fill(0, 255, 255); 
    ellipse(position.x, position.y, d, d);

    PVector zero = new PVector(-1, 0);
    float an = PVector.angleBetween(velocity, zero); 
    push();
    translate(position.x, position.y);
    if (velocity.y < 0) rotate(an);
    if (velocity.y > 0) rotate(-an);
    if (velocity.y == 0 && velocity.x > 0) {
      rotate(PI);
    }
    //image(bulletImage, 0, 0);
    pop();
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
  
  boolean despawn() {
    if (position.x < -d || position.x > width+d || position.y < -d || position.y > height+d ) {
      return true;
    } else {
      return false;
    }
  }
  
  void onHit(){
    
  }
}

class ToiletBell extends Bullet {
  ToiletBell(PVector pos, float a) {
    super(pos, a);
  }
  void display() {
    PVector zero = new PVector(-1, 0);
    float an = PVector.angleBetween(velocity, zero); 
    push();
    translate(position.x, position.y);
    if (velocity.y < 0) rotate(an);
    if (velocity.y > 0) rotate(-an);
    if (velocity.y == 0 && velocity.x > 0) {
      rotate(PI);
    }
    image(bulletImage, 0, 0);
    pop();
  }
}


class Grenade extends Bullet{
  Grenade(PVector pos, float a) {
    super(pos, a);
  }
  
  void onHit(){
    bullets.add(new Grenade(position, -30));
    bullets.add(new Grenade(position, -60));
    bullets.add(new Grenade(position, -90));
    bullets.add(new Grenade(position, -120));
    bullets.add(new Grenade(position, -150));
    bullets.add(new Grenade(position, -180));
    bullets.add(new Grenade(position, 0));
    bullets.add(new Grenade(position, 30));
    bullets.add(new Grenade(position, 60));
    bullets.add(new Grenade(position, 90));
    bullets.add(new Grenade(position, 120));
    bullets.add(new Grenade(position, 150));
  }
}

class Lentil extends Bullet{
  Lentil(PVector pos, float a) {
    super(pos, a);
  }
  
}
