class Spawner {
    PVector position;
    ArrayList<Enemy> enemiesMagazine;
    int cooldown, timer;
    boolean empty;
    PImage image;
    Spawner() {
        position = new PVector(random(width),random(height));
        empty = false;
        cooldown = 60;
        timer = 0;
        enemiesMagazine = new ArrayList();
        cooldown = 100;
        image = basicSpawner2Image;
    }
    
    void spawn() {
        timer++;
        if (timer > cooldown) {
            timer = 0;
            if (enemiesMagazine.size() > 0) {
                enemies.add(enemiesMagazine.get(0));
                enemiesMagazine.remove(0);
            } else {
                if (enemies.size() == 0){
                    empty = true;
                }
            }          
        }
    }
    
    void display() {
        image(image,position.x, position.y);
    }
}

class PalmSpawner extends Spawner {
    PalmSpawner(){
        super();
        cooldown = 60;
         enemiesMagazine.add(new BossEnemy2(position.copy()));
        // for (int i = 0; i < 5;i++) enemiesMagazine.add(new BasicEnemy1(position.copy()));
        image = basicSpawner2Image;
    }
}

class TreeHouseSpawner extends Spawner {
    TreeHouseSpawner(){
        super();
        cooldown = 150;
        for (int i = 0; i < 2;i++) enemiesMagazine.add(new BasicEnemy3(position.copy()));
        image = basicSpawner3Image;
    }
}

class Swamp extends Spawner {
  Swamp() {
    super();
    cooldown = 120;
    for (int i = 0; i < 3; i++) enemiesMagazine.add(new MediumEnemy2(position.copy()));
    image = mediumSpawner2Image;
  }
}
class Hole extends Spawner {
  Hole() {
    super();
    cooldown = 60;
    for (int i = 0; i < random(3,5); i++) enemiesMagazine.add(new MediumEnemy4(position.copy()));
    image = mediumSpawner3Image;
  }
}

class LittleHole extends Spawner {
  LittleHole() {
    super();
    cooldown = 20;
    for (int i = 0; i < 10; i++) enemiesMagazine.add(new MediumEnemy2(position.copy())); //kombinace vsech uz pouzitych
    image = mediumSpawner3Image;
  }
}

class MagicDoor extends Spawner {
  MagicDoor() {
    super();
    cooldown = 40;
    for (int i = 0; i < random(1,3); i++) enemiesMagazine.add(new BossEnemy1(position.copy()));
    image = mediumSpawner1Image;
  }
}
