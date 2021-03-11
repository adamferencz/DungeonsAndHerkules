class Spawner {
  PVector position;

  Spawner() {
    position = new PVector(random(width),random(height));
  }
  
  void spawn(){
    enemies.add(new Enemy(position.copy()));
  }
  
  void display() {
    rect(position.x, position.y, 100, 100);
  }
}
