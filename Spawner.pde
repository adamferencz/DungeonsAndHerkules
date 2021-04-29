class Spawner {
    PVector position;
    ArrayList<Enemy> enemiesMagazine;
    int cooldown, timer;
    boolean empty;
    Spawner(int id) {
        position = new PVector(random(width),random(height));
        empty = false;
        cooldown = 60;
        timer = 0;
        enemiesMagazine = new ArrayList();
        switch(id) {
            case 1 :
            cooldown = 60;
            for (int i = 0; i < 10;i++) enemiesMagazine.add(new MediumEnemy4(position.copy()));
            
            enemiesMagazine.add(new BasicEnemy3(position.copy()));
            // enemiesMagazine.add(new BasicEnemy1(position.copy()));
            // enemiesMagazine.add(new BasicEnemy1(position.copy()));
            // enemiesMagazine.add(new BasicEnemy1(position.copy()));
            break;
            case 2 :
            cooldown = 20; 
            addMoreEnemies(new BasicEnemy1(position.copy()), 10);
            break;
            case 3 :
            addMoreEnemies(new BasicEnemy3(position.copy()), 5);
            break;
            case 4 :
            addMoreEnemies(new BasicEnemy1(position.copy()), 5);
            addMoreEnemies(new BasicEnemy3(position.copy()), 5);
            break;
            default:
            cooldown = 30; 
            addMoreEnemies(new Enemy(position.copy()), level);
            break;
        }
    }
    
    void addMoreEnemies(Enemy enemy, int count) {
        for (int i = 0; i < count;i++) {
            enemiesMagazine.add(enemy.clone());
        }
    }   
    
    void spawn() {
        timer++;
        if (timer > cooldown) {
            timer = 0;
            if (enemiesMagazine.size() > 0) {
                enemies.add(enemiesMagazine.get(0));
                enemiesMagazine.remove(0);
            } else {
                empty = true;
            }          
        }
    }
    
    void display() {
        rect(position.x, position.y, 100, 100);
    }
}
