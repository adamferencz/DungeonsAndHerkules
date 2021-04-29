class Weapon{
  int ammo;
  float damage;
  PImage image;
  
  Weapon(){
    ammo = 20;
    damage = 1;
    image = basicWeapon1Image;
    println(image);
  }
  
  void shoot(){
    bullets.add(new Bullet(player.position, 0));
    bullets.add(new Bullet(player.position, 5));
    bullets.add(new Bullet(player.position, -5));
  }
  
  void display(float x, float y){
    if(image != null){
        image(image, x, y);
    }
  }
}

class Shotgun extends Weapon{
  
  Shotgun(){
    super();
    image = basicWeapon4Image;
  }
  
  void shoot(){
    
    PVector mouse = new PVector(mouseX, mouseY);
    PVector pos = player.position.copy();
    PVector velocity = PVector.sub(mouse, pos);
    
    //bullets.add(new Bullet(pos.add(velocity).add(velocity), 0));
    //bullets.add(new Bullet(pos.add(velocity), 0));
    bullets.add(new Bullet(pos, 0));
  }
  
}

class GrenadeLauncher extends Weapon{
  GrenadeLauncher(){
    super();
    image = mediumWeapon1Image;
  }
  
  void shoot(){
    bullets.add(new Grenade(player.position, 0));
  }
  
}

class ToiletBellGun extends Weapon{
  
  ToiletBellGun(){
    super();
    image = mediumWeapon2Image;
  }
  void shoot(){
    bullets.add(new ToiletBell(player.position, 0));
  }
}
