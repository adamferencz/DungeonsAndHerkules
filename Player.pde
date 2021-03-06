class Player {
    PVector position, velocity;
    Weapon selectedWeapon;
    int selectedWeaponNumber;
    ArrayList<Weapon> weapons;
    float size, hp;
    HpBar hpbar;
    boolean saySit, sitStand, alive, turbo;
    float saySitTimer, speed;
    PImage image;
    
    Player() {
        position = new PVector(width / 2, height / 2);
        velocity = new PVector(0, 0);
        size = 100;
        hp = 100;
        hpbar = new HpBar(hp);
        weapons = new ArrayList<Weapon>();
        weapons.add(new BananaRevolver());
        // weapons.add(new SPDDiscGun());
        // weapons.add(new ToiletBellGun());
        // weapons.add(new GrenadeLauncher());
        selectedWeaponNumber = 0;
        selectedWeapon = weapons.get(selectedWeaponNumber);
        alive = true;
        saySitTimer = 0;
        saySit = false;
        sitStand = true;
        speed = 5;
        image = playerImage;
        
}
    
    void items() {
        if (turbo) {
            speed = 9;
        } else {
            speed = 5;
        }
    }
    
    void sitPet() {
        pet.sit = !pet.sit;
        sitStand = pet.sit;
        saySit = true;
    }
    
    void changeGun(int change) {
        if (change == 1) {
            selectedWeaponNumber++;
            if (weapons.size() == selectedWeaponNumber) {
                selectedWeaponNumber = 0;
            }
            selectedWeapon = weapons.get(selectedWeaponNumber);
        } else {
            selectedWeaponNumber--;
            if (selectedWeaponNumber < 0) {
                selectedWeaponNumber = weapons.size() - 1;
            }
            selectedWeapon = weapons.get(selectedWeaponNumber);
        }
    }
    
    void display() {
        //hitbox
        noFill();
        circle(position.x, position.y, size);
        
        //image
         if (alive == false){
          image(mediumEnemy3Image, position.x, position.y);
        }else {
           image(image, position.x, position.y);
        }
        
        hpbar.run(hp, width / 2, height - 50, 1);
        fill(0);
        textSize(30);
        text(selectedWeaponNumber, 10, height - 100);
        
        //selected weapon image
        selectedWeapon.display(80, height - 50);
        
        //pet sitting
        if (saySit) {
            fill(0);
            textSize(30);
            if (sitStand) {
                text("Sit down!!!", position.x + 10, position.y - 90);
            } else {
                text("Stand up!!!", position.x + 10, position.y - 90);
            }
        }
    }
    
    void border() {
        if (position.x < 0) {
            position.add(new PVector(3, 0));
        }
        if (position.x > width) {
            position.add(new PVector( -3, 0));
        }
        if (position.y < 0) {
            position.add(new PVector(0, 3));
        }
        if (position.y > height) {
            position.add(new PVector(0, -3));
        }
    }
    
    void run(){
        items();
        move();
    }

    void move() {
        if (keys['a'] || keys['A']) { 
            position.add(new PVector( -speed, 0));
        }
        if (keys['d'] || keys['D']) { 
            position.add(new PVector(speed, 0));
        }
        if (keys['w'] || keys['W']) {     
            position.add(new PVector(0, -speed));
        }
        if (keys['s'] || keys['S']) {
            position.add(new PVector(0, speed));
        }
        border();
        if (saySit) {
            saySitTimer++;
            if (saySitTimer > 60) {
                saySitTimer = 0;
                saySit = false;
            }
        }
    }
    
    void gotDamage(float damage) {
        hp -= damage;
        if (hp < 0) {
            alive = false;
        }
    }
    
    void shoot() {
        selectedWeapon.shoot();
        //println( selectedWeapon.getClass().getName() == selectedWeapon.getClass().getName());
        if (selectedWeapon.ammo <= 0) {
            weapons.remove(selectedWeaponNumber);
            if (selectedWeaponNumber > weapons.size() - 1) selectedWeaponNumber = 0;
            changeGun(1);
        }
    }
}
    