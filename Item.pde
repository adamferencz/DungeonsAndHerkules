class Item {
  PVector pos;
  float d;

  float grabTimer; 
  boolean grab;
  boolean died;

  Item(float ID) {
    pos = new PVector(random(width), random(height));
    d = 20;
    grabTimer = 0;
    grab = false;
    died = false;
  }

  void display() {
    if (!grab) {
      image(effect,pos.x, pos.y);
    }
  }

  void grab(PVector pl, float pD) {
    if (!grab) {
      float dist = dist(pl.x, pl.y, pos.x, pos.y); 
      if (dist < d/2+pD) {
        once();
      }
    }
  }

  void run() {
    if (grab) {
      grabTimer++;

      player.turbo = true;

      if (grabTimer > 300) {
        died = true;
        player.turbo = false;
      }
    }
  }

  void once() {
    grab = true;
    grabTimer = 0;
  }
}


class HealItem extends Item {
  HealItem(float ID) {
    super(ID);
  }

  void run() {
  }

  void display() {
    if (!grab) {
      image(heal,pos.x, pos.y);
    }
  }

  void once() {
    grab = true;
    died = true;
    player.hp += 10;
    if (player.hp > 100) player.hp = 100;
  }
}

class Gun1Item extends Item {
  int id;
  Gun1Item(int ID) {
    super(ID);
    id = ID;
  }

  void run() {
  }

  void display() {
    if (!grab) {

      switch(id) {
      case 0 : 
        //fill(100, 255, 0);
        image(basicWeapon4Image, pos.x,pos.y);
        break;
      case 1 : 
        //fill(255, 255, 0);
        image(mediumWeapon1Image, pos.x,pos.y);
        break;
      case 2 : 
        image(mediumWeapon2Image, pos.x,pos.y);
        break;
      // case 3 : 
      //   image(basicWeapon3Image, pos.x,pos.y);
      //   break;
      
      }
     // ellipse(pos.x, pos.y, d, d);
    }
  }

  void once() {
    grab = true;
    died = true;


    switch(id) {
    case 0 : 
      player.weapons.add(new Shotgun());
      break;
    case 1 : 
      player.weapons.add(new GrenadeLauncher());
      break;
    case 2 : 
      player.weapons.add(new ToiletBellGun());
      break;
    // case 3 : 
    //   player.weapons.add(new GrenadeLauncher());
    //   break;
    }

    println("Toilet");
  }
}



class AllItems {
  ArrayList<Item> items;
  boolean [] gun;
  int countGun = 3;

  AllItems() {
    items = new ArrayList <Item> ();
    items.add(new Item(0));
    items.add(new Gun1Item(0));
    gun = new boolean[countGun] ;
    for (int i = 0; i < countGun; i++) {
      gun[i] = false;
    }
  }

  void run() {

    for (int i = items.size()-1; i > -1; i--) {
      Item it = items.get(i); 

      it.grab(player.position, player.size);
      it.run();
      it.display();

      if (it.died) {
        items.remove(i);

        int randGun = round(random(0, countGun-1));
        int randItem = round(random(0, 2));

        //if (randItem == 0) {
        //  for (int j = 0; j < countGun; j++) {
        //    if (randGun == j && gun[j] == true) {
        //      randGun++;
        //      if (randGun >= countGun) randItem++;
        //    }
        //  }
        //}

        switch(randItem) {
        case 0 : 
          items.add(new Gun1Item(randGun));
          gun[randGun] = true;
          break;
        case 1 : 
          items.add(new HealItem(0));
          break;
        case 2 : 
          items.add(new Item(0));
          break;
        }
      }
    }
  }

  //display
}