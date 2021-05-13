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
        velocity = new PVector(random( -5,5), random( -5,5));
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
        newEnemy.velocity = new PVector(random( -5,5), random( -5,5));
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
        
        stroke(0, 50);
        fill(c, 20);
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
        velocity = new PVector(random( -5,5), random( -5,5));
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
        newEnemy.velocity = new PVector(random( -5,5), random( -5,5));
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
        newEnemy.velocity = new PVector(random( - 5,5), random( - 5,5));
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
                dash.setMag(speedLimit / 2);
                velocity.add(dash);
                position.add(velocity);
            } 
        }
    } 
}

class MediumEnemy2 extends Enemy {
    MediumEnemy2(PVector origin) {
        super(origin);
        
        d = 16;
        damage = 3;
        attackSpeed = 20;
        attackCooldown = 0;
        maxHP = 6;
        nowHP = maxHP;
        hpbar = new HpBar(maxHP);
        speedLimit = 1;
    }
    Enemy clone() {
        Enemy newEnemy = new Enemy(position.copy());
        newEnemy.velocity = new PVector(random( - 5, 5), random( - 5, 5));
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
        accToTarget = PVector.sub(target, position);
        accToTarget.setMag(0.1);
        applyForce(accToTarget);
        
        velocity.add(acc);
        velocity.limit(2);
        
        position.add(velocity);
        acc.mult(0);
        
        if (attackCooldown < attackSpeed) {
            attackCooldown++;
        }
    }
    void display() {
        stroke(0);
        fill(c);
        ellipse(position.x, position.y, d, d);
        image(mediumEnemy2Image, position.x, position.y);
        hpbar.run(nowHP, position.x - 5, position.y + 70, 4);
    }
    void hitPlayer(PVector pos, float d) {
        float far = dist(position.x, position.y, pos.x, pos.y);
        if (far < d / 2 + d / 2) {
           if (attackCooldown == attackSpeed) {
                player.hp -= damage;
                attackCooldown = 0;
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
        damage = 9;
        attackSpeed = 25;
        speedLimit = 40;
        dashCooldown = 26;
        //dashTimer = 0;
    }
    
    void display() {
        super.display();
        //image
        image(mediumEnemy3Image , position.x, position.y);
    }
    
    MediumEnemy3 clone() {
        MediumEnemy3 newEnemy = new MediumEnemy3(position.copy());
        newEnemy.velocity = new PVector(random( - 5,5), random( - 5,5));
        return newEnemy;
    }
    
    void update(PVector target) {
        super.update(target);
        //get accToTarget
        
        PVector dash = PVector.sub(target, position);
        dashTimer = dashTimer + 2;
        if (dashTimer > dashCooldown) {
            if (dash.mag() < 250) {
                dashTimer = 0;
                dash.setMag(speedLimit / 1.5);
                velocity.add(dash);
                position.add(velocity);
            } 
        }
    } 
}

class MediumEnemy4 extends Enemy {
    
    MediumEnemy4(PVector origin) {
        super(origin);
        velocity = new PVector(random( -5, 5), random( -5, 5));
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
        newEnemy.velocity = new PVector(random( -5, 5), random( -5, 5));
        return newEnemy;
    }
}

class BossEnemy1 extends Enemy{
    int spellD, spellTimer, spellCooldown, spellDelTimer, spellDelCooldown;
    float spellDamage;
    PVector spellPosition;
    boolean spellCreated, spellGrowing;
    BossEnemy1(PVector origin) {
        super(origin);
        position.x = width / 2;
        position.y = height / 2;
        velocity = new PVector(0, 0);
        acc = new PVector(0, 0);
        d = 200;
        c = #FF2E4E;
        damage = 25;
        spellDamage = 0.259;
        attackSpeed = 120;
        attackCooldown = 0;
        alive = true;
        maxHP = 75;
        nowHP = maxHP;
        hpbar = new HpBar(maxHP);
        speedLimit = 4.5;
        friction = 0.95;
        spellD = 125;
        spellTimer = 0;
        spellCooldown = 300;
        spellDelTimer = 0;
        spellDelCooldown = 360;
        spellPosition = new PVector(random(0,width), random(0,height));
        spellCreated = false;
        spellGrowing = true;
    }
    
    void update(PVector target) {
        super.update(target);
        if (spellCreated == true) {
            if (spellGrowing == true) {
                spellDelTimer++;
                spellD = spellDelTimer; 
                
                if (spellDelTimer >= spellDelCooldown) {
                    spellGrowing = false;    
                    
                }
            } else {
                spellDelTimer--;
                spellD = spellDelTimer;
                if (spellD <= 0) {
                    spellCreated = false;
                }
            }
               damagePlayer();
               displaySpells();
        } else {
            spellTimer++;
            if (spellTimer >= spellCooldown) {
                spellPosition = new PVector(random(0,width), random(0,height));
                spellCreated = true;
                spellTimer = 0;
                spellGrowing = true;
            }
        }
    }   
    
    void displaySpells() {
        fill(0,255,0);
        ellipse(spellPosition.x,spellPosition.y, spellD, spellD);
        fill(0); 
    }
    
    void damagePlayer() {
        float d = dist(spellPosition.x, spellPosition.y, player.position.x, player.position.y);
        if (d < spellD / 2 + player.size / 2) {
            player.hp -= spellDamage;
        }
    }
    
    void display() {
        super.display();
        //image
        image(bossEnemy1Image, position.x, position.y);
    }
}

class BossEnemy2 extends Enemy {
    float shootTimer;
    BossEnemy2(PVector origin) {
        super(origin);
        damage = 2;
        shootTimer = 0;
        d = 50;
        maxHP = 100;
        nowHP = maxHP;
        hpbar = new HpBar(maxHP);
    }
    
    void display() {
        super.display();
        //image
        ellipse(position.x, position.y, d, d);
        image(bossEnemy2Image, position.x, position.y);
    }
    
    BossEnemy2 clone() {
        BossEnemy2 newEnemy = new BossEnemy2(position.copy());
        newEnemy.velocity = new PVector(random( - 5, 5), random( - 5, 5));
        return newEnemy;
    }
    
    void update(PVector target) {
        super.update(target);
        
        shootTimer++;
        
        if (shootTimer > 40) {
            bulletsEnemy.add(new ToiletBellEnemy(position, 0));
            shootTimer = 0;
        }
    }
}