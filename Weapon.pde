class Weapon{
  int ammo;
  float damage;
  PImage image;
  Weapon(){
    ammo = 20;
    damage = 1;
    //image;
  }
  
  void shoot(){
    bullets.add(new Bullet(player.position, 0));
    bullets.add(new Bullet(player.position, 5));
    bullets.add(new Bullet(player.position, -5));
  }
  
  void display(){
    
  }
}

//class Shotgun extends Weapon{
  
  
//}
