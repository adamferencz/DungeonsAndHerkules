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
        fill(100, 100, 100);
        stroke(0);
        ellipse(position.x, position.y, d, d);
        
        PVector zero = new PVector( - 1, 0);
        float an = PVector.angleBetween(velocity, zero); 
        push();
        translate(position.x, position.y);
        if (velocity.y < 0) rotate(an);
        if (velocity.y > 0) rotate( - an);
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
        if (far < d / 2 + enemyD / 2) {
            return true;
        } else return false;
 }
    
    boolean despawn() {
        if (position.x < - d || position.x > width + d || position.y < - d || position.y > height + d) {
            return true;
        } else {
            return false;
        }
 }
    
    void onHit() {
        
 }
}

class ToiletBell extends Bullet {
    ToiletBell(PVector pos, float a) {
        super(pos, a);
 }
    void display() {
        PVector zero = new PVector( - 1, 0);
        float an = PVector.angleBetween(velocity, zero); 
        push();
        translate(position.x, position.y);
        if (velocity.y < 0) rotate(an);
        if (velocity.y > 0) rotate( - an);
        if (velocity.y == 0 && velocity.x > 0) {
            rotate(PI);
        }
        image(bulletImage, 0, 0);
        pop();
 }
}

class ToiletBellEnemy extends Bullet {
    ToiletBellEnemy(PVector pos, float a) {
        super(pos, a);
        d = 10; 
        angel = a;
        position = new PVector(pos.x, pos.y);
        mouse = new PVector(player.position.x, player.position.y);
        
        
        a = map(a, 0, 360, 0, TWO_PI);
        velocity = PVector.sub(mouse, position);
        velocity.rotate(a);
        velocity.setMag(10);
        damage = 20;
 }
    void display() {
        PVector zero = new PVector( - 1, 0);
        float an = PVector.angleBetween(velocity, zero); 
        push();
        translate(position.x, position.y);
        if (velocity.y < 0) rotate(an);
        if (velocity.y > 0) rotate( - an);
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
    
    void onHit() {
        bullets.add(new Lentil(position, -30));
        bullets.add(new Lentil(position, -60));
        bullets.add(new Lentil(position, -90));
        bullets.add(new Lentil(position, -120));
        bullets.add(new Lentil(position, -150));
        bullets.add(new Lentil(position, -180));
        bullets.add(new Lentil(position, 0));
        bullets.add(new Lentil(position, 30));
        bullets.add(new Lentil(position, 60));
        bullets.add(new Lentil(position, 90));
        bullets.add(new Lentil(position, 120));
        bullets.add(new Lentil(position, 150));
 }
}

class Lentil extends Bullet{
    Lentil(PVector pos, float a) {
        super(pos, a);
 }
    
}

class SPDDisk extends Bullet {
    boolean despawnDisk;
    SPDDisk(PVector pos, float a) {
        super(pos, a);
        despawnDisk = false;
 }
    Enemy detectEnemy() {
        int range = width;
        float minDist = width / 2;
        damage= 20 ;
        Enemy winner = null;
        for (Enemy enemy : enemies) {
            float d = dist(enemy.position.x, enemy.position.y, position.x, position.y);
           if (d < enemy.d + range) {
                if (d < minDist) {
                    winner = enemy;
                    minDist = d;
                }
        }
        }
        //if(winner==null) {
        return winner;
 }
    void move() {
        super.move();
        
        PVector acc;
        PVector target;
        Enemy detected = detectEnemy();
        if (detected ==  null) {
            target= player.position;
        } else {
            target= detected.position;
        }
        
        acc = PVector.sub(target, position);
        acc.normalize();
        acc.mult(0.5);
        // accToTarget = PVector.sub(target, position);  
        //accToTarget.setMag(0.1);
        //applyForce(accToTarget);w
        //update velocity
        velocity.add(acc);
        velocity.mult(0.98);
        velocity.limit(7.5);
        
        float p = dist(player.position.x, player.position.y, position.x, position.y);
        if (p < d) {
        } else {
            
        }
        if (p < 10) {
            despawnDisk = true;
            isWeaponInHand = true;  
        }
        if (p < 100) {
            
        }
    }
        void display() {
            super.display();
            image(mediumWeapon4Image,position.x,position.y);
        }

    void onHit() {
        bullets.add(new SPDDisk(position, 0));
    }

    boolean despawn(){
        return despawnDisk;
    }
}    