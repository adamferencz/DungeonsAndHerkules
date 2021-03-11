class HpBar {
  float x, y, max;


  HpBar(float max_) {
    x = width/2;
    y = height-50;
    max = max_;
  }


  void run(float hp_) {
    push();  
    float w = 500;
    float hp = hp_;
    if (hp < 0) hp = 0;
    float xload = map(hp, 0, max, -w/2, w/2);
    float wload = map(xload, -w/2, w/2, w, 0);
    translate(x, y);

    rectMode(CENTER);

    noStroke();
    fill(0, 255, 0);
    rect(0, 0, w, 25, 255);

    noStroke();
    rectMode(CORNER);
    fill(255, 255, 255);
    rect(xload, -12, wload, 25);

    rectMode(CENTER);
    strokeWeight(2);
    stroke(0);
    noFill();
    rect(0, 0, w, 25, 255);



    pop();
  }
}
