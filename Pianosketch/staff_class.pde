class Staff {
  float x;
  float y;
  PImage img;
  Staff(float temp_x, float temp_y) {
    img = loadImage("assets/staff.png");
    // img.resize(width,0);
    temp_x = x;
    temp_y = y;
    imageMode(CORNERS);
  }
  void drawStaff(){
    image(img, x, y);
  }

}
