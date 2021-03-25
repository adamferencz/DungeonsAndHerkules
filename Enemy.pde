class Enemy {
  PVector position;
  PVector velocity;
  PVector acc;
  PVector accToTarget;
  float d, damage, attackSpeed, attackCooldown;
  color c;
  float maxHP, nowHP;
  boolean alive;
  HpBar hpbar;
  

  Enemy(PVector origin) {
    position = origin;
    velocity = new PVector(2.5, 5);
    acc = new PVector(0, 0);
    d = 16;
    c = #FF2E4E;
    damage = 2;
    attackSpeed = 60;
    attackCooldown = 0;
    alive = true;
    maxHP = 10;
    nowHP = maxHP;
    hpbar = new HpBar(maxHP);
  }
  
  void gotDamage(float damage){
    nowHP -= damage;
    if (nowHP < 0){
      alive = false;
    }
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
  
  //void healthBar() {
  //  rectMode (CORNER);
  //  strokeWeight(2);
  //  float onePercentOfHP = maxHP/100;
  //  float howManyTimes = 100/onePercentOfHP;
  //  float defernceBetweenHPs = maxHP - nowHP;
  //  float HPStill = (onePercentOfHP*howManyTimes) - (defernceBetweenHPs/onePercentOfHP);
  //  stroke (0);
  //  noFill();
  //  fill (255);
  //  rect(position.x - 45, position.y + 95, 100, 10);
  //  if (nowHP <= 23) {
  //    fill (255, 0, 0);
  //  } else {
  //    if (nowHP <= 33) {
  //      fill (255, 106, 0);
  //    } else {
  //      if (nowHP <=50) {
  //        fill (255, 216, 0);
  //      } else {
  //        if (nowHP <= 67) {
  //          fill (241, 245, 59);
  //        } else {
  //          if (nowHP > 67) {
  //            fill (94, 255, 97);
  //          }
  //        }
  //      }
  //    }
  //  }
  //  rect(position.x - 45, position.y + 95, HPStill, 10);
  //}
  
  void display() {

    stroke(0);
    fill(c);
    ellipse(position.x, position.y, d, d);

    //image
    image(enemyImage, position.x, position.y);
    
    hpbar.run(nowHP, position.x - 5,position.y + 70, 4);
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
