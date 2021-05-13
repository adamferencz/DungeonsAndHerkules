//Verze 4

Player player;
int level;
ArrayList<Spawner> spawners;
ArrayList<Enemy> enemies;
ArrayList <Bullet> bullets;
ArrayList <Bullet> bulletsEnemy;
Pet pet;
PETanimation animation, animationR;



boolean[] keys = new boolean[128];
PImage playerImage, bulletImage;
PImage basicEnemy1Image, basicEnemy2Image, basicEnemy3Image;
PImage mediumEnemy1Image, mediumEnemy2Image, mediumEnemy3Image, mediumEnemy4Image;
PImage bossEnemy1Image, bossEnemy2Image, bossEnemy3Image, bossEnemy4Image;

PImage basicSpawner1Image, basicSpawner2Image, basicSpawner3Image, mediumSpawner1Image,mediumSpawner2Image,mediumSpawner3Image, mediumSpawner4Image;

PImage basicWeapon1Image,basicWeapon2Image,basicWeapon3Image,basicWeapon4Image,mediumWeapon1Image ,mediumWeapon2Image ,mediumWeapon3Image ,ultimateWeaponImage;    
PImage basicAmmo1Image ,mediumAmmo1Image,basicAmmo2Image ,basicAmmo3Image;    
PImage mediumShrapnel1Image  ,mediumShrapnel2Image  ,mediumShrapnel3Image  ,mediumShrapnel4Image  ,ultimateShrapnel1Image,ultimateShrapnel2Image,ultimateShrapnel3Image;
PImage petImage, petImage1;

void setup() {
    size(1024, 720);
    level = 0;
    loadImages();
    
    //objects
    player = new Player();
    pet = new Pet();
    animation = new PETanimation("petFIVEleft", 2);
    animationR = new PETanimation("petFIVEright", 2);//2 = pocet obr na animaci
    
    //arrayLists
    spawners = new ArrayList<Spawner>();
    enemies = new ArrayList<Enemy>();
    bullets = new ArrayList <Bullet> ();
    bulletsEnemy = new ArrayList <Bullet> ();
}

void draw() {
    background(255);
    
    if (player.hp <= 0) {
        background(255, 0, 0);
        textSize(20);
        fill(0);
        text("LVL: " + level, 50, 50);
        text("You are dead :( ... Press E to continue..", 50, 70);
    }
    
    textSize(20);
    fill(0);
    text("LVL: " + level, 50, 50);
    if (enemies.size() == 0 && spawners.size() == 0) {
        text("Press E to continue..", 50, 70);
    }
    
    imageMode(CENTER);
    
    if (player.hp > 0) player.move();
    
    pet.move();
    pet.killEnemy(); 
    pet.display();
    
    for (int i = bullets.size() - 1; i >= 0; i--) {
        Bullet b = bullets.get(i);
        b.move();
        b.display(); 
        
        for (int j = enemies.size() - 1; j >= 0; j--) {
            Enemy e = enemies.get(j);
            if (b.hit(e.position, e.d)) {
                e.gotDamage(b.damage);
                b.onHit();
                bullets.remove(i);//fixme for toilet bell
                break;
            }
            if (e.alive == false) enemies.remove(j);
        }
        if (b.despawn()) {
            bullets.remove(i);
        }
    }
    
    for (int i = bulletsEnemy.size() - 1; i >= 0; i--) {
        Bullet b = bulletsEnemy.get(i);
        b.move();
        b.display(); 
        if (b.hit(player.position, player.size)) {
            player.gotDamage(b.damage);
            b.onHit();
            bulletsEnemy.remove(i);//fixme for toilet bell
        }
        if (b.despawn()) {
            bulletsEnemy.remove(i);
        }
    }
    
    
    
    for (int i = spawners.size() - 1; i >= 0; i--) {
        Spawner s = spawners.get(i);
        s.spawn();
        s.display();
        if (s.empty == true) {
            spawners.remove(i);
        }
    }
    
    for (int i = enemies.size() - 1; i >= 0; i--) {
        Enemy e = enemies.get(i);
        e.hitPlayer(player.position, player.size);
        e.update(player.position);
        e.display();
    }
    
    player.display();
    
}

void keyPressed() {
    if (int(key) > 0 && int(key) < 128) {
        keys[key] = true;
    }
    
    if (keys['e'] || keys['E']) {
        if (player.hp <= 0) {
            level = 0;
            player.hp = 100;
        }
    }
    
    if (enemies.size() == 0 && spawners.size() == 0) {       
        if (keys['e'] || keys['E']) {       
            level++;
            startWave(); //<>//
        }
    }
    
    if (key == 'q' || key == 'Q') {
        player.sitPet();
    }
}

void keyReleased() {
    if (int(key) > 0 && int(key) < 128) {
        keys[key] = false;
    }
}

void mousePressed() {
    player.shoot();
}

void mouseWheel(MouseEvent event) {
    float direction = event.getCount();
    player.changeGun(int(direction));
}
