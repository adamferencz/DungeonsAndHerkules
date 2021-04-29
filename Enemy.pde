class Enemy {
    PVector position;
    PVector velocity;
    PVector acc;
    PVector accToTarget;
    float d, damage, attackSpeed, attackCooldown;
    color c;
    float maxHP, nowHP, speedLimit, friction;
    boolean alive;
    HpBar hpbar;
    
    Enemy(PVector origin) {
        position = origin;
        velocity = new PVector(random( - 5,5), random( - 5,5));
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
        speedLimit = 5;
        friction = 0.95;
    }
    
    Enemy clone() {
        Enemy newEnemy = new Enemy(position.copy());
        newEnemy.velocity = new PVector(random( - 5,5), random( - 5,5));
        return newEnemy;
    }
    
    void gotDamage(float damage) {
        nowHP -= damage;
        if (nowHP < 0) {
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
        velocity.limit(speedLimit);
        
        // Add the current speed to the location.
        position.add(velocity);
        acc.mult(0);

        // Friction slowdown 
        velocity.mult(friction);
        
        //attack cooldown
        if (attackCooldown < attackSpeed) {
            attackCooldown++;
        }
    }
    
    void display() {
        
        stroke(0);
        fill(c);
        ellipse(position.x, position.y, d, d);
        
        //image
        //image(enemyImage, position.x, position.y);
        
        hpbar.run(nowHP, position.x - 5,position.y + 70, 4);
    }
    
    void hitPlayer(PVector pos_, float d_) {
        float far = dist(position.x, position.y, pos_.x, pos_.y);
        if (far < d / 2 + d_ / 2) {
            if (attackCooldown == attackSpeed) {
                player.hp -= damage;
                attackCooldown = 0;
            } 
        }
    }
    
}

class BasicEnemy1 extends Enemy{
    
    BasicEnemy1(PVector origin) {
        super(origin);
        velocity = new PVector(random( - 5,5), random( - 5,5));
        d = 50;
        damage = 1;
        attackSpeed = 30;
        maxHP = 4;
        nowHP = maxHP;
        hpbar = new HpBar(maxHP);
        speedLimit = 5;
    }
    
    void display() {      
        super.display();
        //image
        image(basicEnemy1Image, position.x, position.y);
    }
    
    BasicEnemy1 clone() {
        BasicEnemy1 newEnemy = new BasicEnemy1(position.copy());
        newEnemy.velocity = new PVector(random( - 5,5), random( - 5,5));
        return newEnemy;
    }
}

class BasicEnemy3 extends Enemy{
    int dashCooldown, dashTimer;
    BasicEnemy3(PVector origin) {
        super(origin);
        // velocity = new PVector(random(-5,5), random(-5,5));
        // d = 50;
        // damage = 1;
        // attackSpeed = 30;
        // maxHP = 4;
        // nowHP = maxHP;
        // hpbar = new HpBar(maxHP);
        speedLimit = 20;
        dashCooldown = 100;
        dashTimer = 0;
    }
    
    void display() {
        super.display();
        //image
        image(basicEnemy3Image, position.x, position.y);
    }
    
    BasicEnemy3 clone() {
        BasicEnemy3 newEnemy = new BasicEnemy3(position.copy());
        newEnemy.velocity = new PVector(random(- 5,5), random(- 5,5));
        return newEnemy;
    }
    
    void update(PVector target) {
        super.update(target);
        //get accToTarget
        
        PVector dash = PVector.sub(target, position);
        dashTimer++;
        if (dashTimer > dashCooldown) {
            if (dash.mag() < 250) {
                dashTimer = 0;
                dash.setMag(speedLimit/2);
                velocity.add(dash);
                position.add(velocity);
            } 
        }
    } 
}

class MediumEnemy3 extends Enemy{
    int dashCooldown, dashTimer;
    MediumEnemy3(PVector origin) {
        super(origin);
        // velocity = new PVector(random(-5,5), random(-5,5));
         d = 25;
       damage =9;
      attackSpeed = 25;
        speedLimit = 40;
        dashCooldown = 26;
        //dashTimer = 0;
    }
    
    void display() {
        super.display();
        //image
 image( mediumEnemy3Image , position.x, position.y);
    }
    
    MediumEnemy3 clone() {
        MediumEnemy3 newEnemy = new MediumEnemy3(position.copy());
        newEnemy.velocity = new PVector(random(- 5,5), random(- 5,5));
        return newEnemy;
    }
    
    void update(PVector target) {
        super.update(target);
        //get accToTarget
        
        PVector dash = PVector.sub(target, position);
        dashTimer= dashTimer+2;
        if (dashTimer > dashCooldown) {
            if (dash.mag() < 250) {
                dashTimer = 0;
                dash.setMag(speedLimit/1.5);
                velocity.add(dash);
                position.add(velocity);
            } 
        }
    } 
}

class MediumEnemy4 extends Enemy {

  MediumEnemy4(PVector origin) {
    super(origin);
    velocity = new PVector(random( - 5, 5), random( - 5, 5));
    d = 50;
    damage = 30;
    attackSpeed = 30;
    maxHP = 50;
    nowHP = maxHP;
    hpbar = new HpBar(maxHP);
    speedLimit = 3;
  }

  void display() {      
    super.display();
    //image
    image(mediumEnemy4Image, position.x, position.y);
  }

  BasicEnemy1 clone() {
    BasicEnemy1 newEnemy = new BasicEnemy1(position.copy());
    newEnemy.velocity = new PVector(random( - 5, 5), random( - 5, 5));
    return newEnemy;
  }
}