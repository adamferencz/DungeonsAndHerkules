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
            cooldown = 120;
            enemiesMagazine.add(new Enemy(position.copy()));
            enemiesMagazine.add(new Enemy(position.copy()));
            enemiesMagazine.add(new Enemy(position.copy()));
            break;
            case 2 :
            cooldown = 30; 
            addMoreEnemies(new Enemy(position.copy()), 10);
            break;
            default:
            cooldown = 30; 
            addMoreEnemies(new Enemy(position.copy()), level);
            break;
        }
    }
    
    void addMoreEnemies(Enemy enemy, int count) {
        for (int i = 0; i < count;i++) {
            Enemy newEnemy = enemy.clone();
            enemiesMagazine.add(newEnemy);
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
