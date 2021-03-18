class Enemy {
  PVector position;
  PVector velocity;
  PVector acc;
  PVector accToTarget;
  float d, damage, attackSpeed, attackCooldown;
  color c;
  

  Enemy(PVector origin) {
    position = origin;
    velocity = new PVector(2.5, 5);
    acc = new PVector(0, 0);
    d = 16;
    c = #FF2E4E;
    damage = 2;
    attackSpeed = 60;
    attackCooldown = 0;
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
    
    //attack cooldown
    if (attackCooldown < attackSpeed){
      attackCooldown++;
    }
  }

  void display() {

    stroke(0);
    fill(c);
    ellipse(position.x, position.y, d, d);

    //image
    image(enemyImage, position.x, position.y);
  }
  
  void hitPlayer(PVector pos_, float d_) {
    float far = dist(position.x, position.y, pos_.x, pos_.y);
    if (far < d/2 + d_/2) {
      if (attackCooldown == attackSpeed){
        player.hp -= damage;
        attackCooldown = 0;
      } 
    }
  }
  
  
}
