class HpBar {
  float max;


  HpBar(float max_) {
    max = max_;
  }


  void run(float hp_, float x, float y, float devidet) {
    push();
    float w = 500;
    float hp = hp_;
    if (hp < 0) hp = 0;
    float xload = map(hp, 0, max, -w/2, w/2);
    float wload = map(xload, -w/2, w/2, w, 0);
    float proc = hp/max *100;
    translate(x,y);

    rectMode(CENTER);

    noStroke();

    if (proc <= 23) {
      fill (255, 0, 0);
    } else {
      if (proc <= 33) {
        fill (255, 106, 0);
      } else {
        if (proc <=50) {
          fill (255, 216, 0);
        } else {
          if (proc <= 67) {
            fill (241, 245, 59);
          } else {
            if (proc > 67) {
              fill(0, 255, 0);
            }
          }
        }
      }
    }

    rect(0, 0, w/devidet, 25/devidet, 255);

    noStroke();
    rectMode(CORNER);
    fill(255, 255, 255);
    rect(xload/devidet, -12/devidet, wload/devidet, 25/devidet);

    rectMode(CENTER);
    strokeWeight(2);
    stroke(0);
    noFill();
    rect(0, 0, w/devidet, 25/devidet, 255);

    pop();
  }
}
