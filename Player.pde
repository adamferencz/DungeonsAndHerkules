class Player {
  PVector position, velocity;
  float size;

  Player() {
    position = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    size = 100;
  }

  void display() {
    //hitbox
    noFill();
    circle(position.x, position.y, size);
    
    //image
    image(playerImage,position.x, position.y);
  }

void border() {
    if (position.x < 0) {
      position.add(new PVector(3, 0));
    }
    if (position.x > width) {
      position.add(new PVector(-3, 0));
    }
    if (position.y < 0) {
      position.add(new PVector(0, 3));
    }
    if (position.y > height) {
      position.add(new PVector(0, -3));
    }
  }

void move() {
    if (keys['a'] || keys['A']) { 
      position.add(new PVector(-3, 0));
    }
    if (keys['d'] || keys['D']) { 
      position.add(new PVector(3, 0));
    }
    if (keys['w'] || keys['W']) {     
      position.add(new PVector(0, -3));
    }
    if (keys['s'] || keys['S']) {
      position.add(new PVector(0, 3));
    }
    border();
  }
}
