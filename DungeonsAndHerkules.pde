//Verze 4

Player player;
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
  
  //objects
  player = new Player();
  pet = new Pet();
  animation = new PETanimation("petFIVEleft", 2);
  animationR = new PETanimation("petFIVEright", 2);//2 = pocet obr na animaci
  
  //arrayLists
  spawners = new ArrayList<Spawner>();
  enemies = new ArrayList<Enemy>();
  bullets = new ArrayList <Bullet> ();

  for (int i = 0; i < 3; i++) {//fixme
    spawners.add(new Spawner());
  }
  
  //images
  playerImage = loadImage("images\\data\\player\\playerTWOdown.png");
  enemyImage = loadImage("images\\data\\enemy\\basic\\enemyTHREE.png");
  petImage = loadImage("images\\data\\pet\\petFIVEleft1.png");
  bulletImage = loadImage("images\\data\\weapon\\ammo\\ammoTWOmed.png");
  petImage1 = loadImage("images\\data\\pet\\petFIVEsitting.png");
}

void draw() {
  background(255);
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


  for (Spawner spawner : spawners) {
    spawner.display();
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
    for (Spawner spawner : spawners) { //fixme     
        spawner.spawn();      
    }
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
