//Verze 4

Player player;
int level;
ArrayList<Spawner> spawners;
ArrayList<Enemy> enemies;
ArrayList <Bullet> bullets ;
Pet pet;
PETanimation animation, animationR;



boolean [] keys = new boolean[128];
PImage playerImage, enemyImage, bulletImage;
PImage petImage, petImage1;

void setup() {
  size(1024, 720);
  level = 1;
  
  //objects
  player = new Player();
  pet = new Pet();
  animation = new PETanimation("petFIVEleft", 2);
  animationR = new PETanimation("petFIVEright", 2);//2 = pocet obr na animaci
  
  //arrayLists
  spawners = new ArrayList<Spawner>();
  enemies = new ArrayList<Enemy>();
  bullets = new ArrayList <Bullet> ();
  
  //images
  playerImage = loadImage("images\\data\\player\\playerTWOdown.png");
  enemyImage = loadImage("images\\data\\enemy\\basic\\enemyTHREE.png");
  petImage = loadImage("images\\data\\pet\\petFIVEleft1.png");
  bulletImage = loadImage("images\\data\\weapon\\ammo\\ammoTWOmed.png");
  petImage1 = loadImage("images\\data\\pet\\petFIVEsitting.png");
}

void draw() {
  background(255);

  if (spawners.size() == 0){
    textSize(10);
    fill(0);
    text("LVL: " + level + " Press E to continue..", 10, width - 10);
  }

  imageMode(CENTER);
  player.move();
  player.display();
  
  pet.move();
  pet.killEnemy(); 
  pet.display();

  for (int i = bullets.size()-1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    b.move();
    b.display(); 

    for (int j = enemies.size()-1; j >= 0; j--) {
      Enemy e = enemies.get(j);
      if (b.hit(e.position, e.d)) {
        e.gotDamage(b.damage);
        b.onHit();
        bullets.remove(i);//fixme for toilet bell
        if (e.alive == false) enemies.remove(j);
        break;
      }
    }
    if (b.despawn()) {
      bullets.remove(i);
    }
  }



  for (int i = spawners.size()-1; i >= 0; i--) {
    Spawner s = spawners.get(i);
    s.spawn();
    s.display();
    if(s.empty == true){
      spawners.remove(i);
      if (spawners.size() == 0){
        level++;
      }
    }
  }
  
  for (int i = enemies.size()-1; i >= 0; i--) {
    Enemy e = enemies.get(i);
    e.hitPlayer(player.position, player.size);
    e.update(player.position);
    e.display();
  }
  
}

void keyPressed() {
  if (int(key) > 0 && int(key) < 128) {
    keys[key] = true;
  }
  
  if (keys['e'] || keys['E']) {
    startWave(); //<>//
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
