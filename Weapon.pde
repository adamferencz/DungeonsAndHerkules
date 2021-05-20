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
    ammo--;
  }
  
  void display(float x, float y){
    if(image != null){
        image(image, x, y);
        textSize(30);
        fill(0);
        text(ammo, x+50, y-10);
    }
  }
}

//inf
class BananaRevolver extends Weapon{
  
  BananaRevolver(){
    super();
    image = basicWeapon1Image;
  }
  
  void shoot(){
    PVector mouse = new PVector(mouseX, mouseY);
    PVector pos = player.position.copy();
    PVector velocity = PVector.sub(mouse, pos);
  
    bullets.add(new Bullet(pos, 0));
  }

    void display(float x, float y){
    if(image != null){
        image(image, x, y);
        textSize(30);
        fill(0);
        text("∞", x+50, y-10);
    }
  }
  
}

//0
class Shotgun extends Weapon{
  
  Shotgun(){
    super();
    image = basicWeapon4Image;
  }
  
  void shoot(){
    super.shoot();
    PVector mouse = new PVector(mouseX, mouseY);
    PVector pos = player.position.copy();
    PVector velocity = PVector.sub(mouse, pos);
    
    //bullets.add(new Bullet(pos.add(velocity).add(velocity), 0));
    //bullets.add(new Bullet(pos.add(velocity), 0));
    bullets.add(new Bullet(pos, 0));
    bullets.add(new Bullet(pos, 3));
    bullets.add(new Bullet(pos, -3));
    bullets.add(new Bullet(pos, 5));
    bullets.add(new Bullet(pos, -5));
  }
  
}

//1
class GrenadeLauncher extends Weapon{
  GrenadeLauncher(){
    super();
    image = mediumWeapon1Image;
  }
  
  void shoot(){
    super.shoot();
    bullets.add(new Grenade(player.position, 0));
  }
  
}

//2
class ToiletBellGun extends Weapon{
  
  ToiletBellGun(){
    super();
    image = mediumWeapon2Image;
  }
  void shoot(){
    super.shoot();
    bullets.add(new ToiletBell(player.position, 0));
  }
}

//3
class SPDDiscGun extends Weapon{
  SPDDiscGun(){
    super();
ammo = 1;
image = mediumWeapon4Image;
}
  
  void shoot(){
if(    isWeaponInHand == true){
       bullets.add(new SPDDisk(player.position, 0));
    isWeaponInHand = false;

}
    }

}


//4
//odrazeni
