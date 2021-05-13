class Pet {
  PVector position;
  PVector velocity;
  PVector acc;
  PVector accToTarget;
  float size;
  float range;
  PVector target;
  boolean sit;


  Pet() {
    position = new PVector(550, 400);
    velocity = new PVector(5, 5);
    acc = new PVector(0, 0);
    range = 200;
    sit = false;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  Enemy detectEnemy() {
    float minDist = width;
    Enemy winner = null;
    for (Enemy enemy : enemies) {
      float d = dist(enemy.position.x, enemy.position.y, position.x, position.y);
      if (d<enemy.d+range) {
        if (d<minDist) {
          winner=enemy;
          minDist=d;
        }
      }
    }
    //if (winner==null) {
    return winner;
  }

  void killEnemy() {
    for (int i = enemies.size()-1; i >= 0; i--) {
      Enemy e = enemies.get(i);
      float d = dist(e.position.x, e.position.y, position.x, position.y);
      if (d<e.d+size) {
        e.gotDamage(1);
        break;
      }
    }
  }


  void move() {
    //detectEnemy();

    Enemy detected = detectEnemy();
    if (detected==null) {
      target = player.position;
    } else {
      target = detected.position;
    }


    acc = PVector.sub(target, position);
    acc.normalize();
    acc.mult(0.5);
    // accToTarget = PVector.sub(target, position);  
    //accToTarget.setMag(0.1);
    //applyForce(accToTarget);

    //update velocity
    velocity.add(acc);
    velocity.limit(2.5);


    // Add the current speed to the location.
    float p = dist(player.position.x, player.position.y, position.x, position.y);
    if (p < 130 && enemies.size() < 1) {
    } else {

      if (sit) {
        velocity.set(0, 0);
      }

      position.add(velocity);
      acc.mult(0);
    }
  }

  void display () {
    noFill();

    float p = dist(player.position.x, player.position.y, position.x, position.y);
    if (sit) {
      image(petImage1, position.x, position.y);
    } else if (p < 130 && enemies.size() < 1) { 
      //circle(position.x, position.y, size);
      image(petImage1, position.x, position.y);
    } else {
      //circle(position.x, position.y, size);
      //image(petImage, position.x, position.y);
      if (pet.velocity.x < 0) {
        animation.display(position.x, position.y);
      } else {
        animationR.display(position.x, position.y);
      }
    }

    //todo animate();

    //display range
    //circle(position.x, position.y, range);
  }
}


class PETanimation {
  PImage[]images;
  int imageCount;
  int frame;
  int time;
  PETanimation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];
    for (int i = 0; i < imageCount; i++) {
      print (pet.velocity.x);
      String filename = imagePrefix + i + ".png";
      images[i] = loadImage("images\\data\\pet\\"+filename);
    }
    time = 1;
  }

  void display(float xpos, float ypos) {
    time ++;

    if (time%8==0) {
      frame = (frame+1) % imageCount;
      time = 0;
    }  
    image(images[frame], xpos, ypos);
  }

  int getWidth() {
    return images[0].width;
  }
}