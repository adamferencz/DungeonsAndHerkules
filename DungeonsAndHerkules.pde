//Verze 2

Player player;
ArrayList<Spawner> spawners;
ArrayList<Enemy> enemies;

boolean [] keys = new boolean[128];
PImage playerImage, enemyImage;

void setup() {
  size(920, 560);
  player = new Player();

  spawners = new ArrayList<Spawner>();
  enemies = new ArrayList<Enemy>();

  for (int i = 0; i < 3; i++) {//fixme
    spawners.add(new Spawner());
  }

  playerImage = loadImage("images\\data\\player\\playerTWOdown.png");
  enemyImage = loadImage("images\\data\\enemy\\basic\\enemyTHREE.png");

}

void draw() {
  background(255);
  imageMode(CENTER);
  player.move();
  player.display();

  for (Spawner spawner : spawners) {
    spawner.display();
  }

  for (Enemy enemy : enemies) {
    enemy.update(player.position);
    enemy.display();
  }
}

void keyPressed() {
  if (int(key) > 0 && int(key) < 128) {
    keys[key] = true;
  }
}

void keyReleased() {
  if (int(key) > 0 && int(key) < 128) {
    keys[key] = false;
  }
  for (Spawner spawner : spawners) { //fixme 
    spawner.spawn();
  } 
} 
