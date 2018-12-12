class Staff {
float x;
float y;
int height;
PImage img;
PImage img2;
Staff( float temp_y, int temp_height) {
        this.y = temp_y;
        this.height = temp_height;
        img = loadImage("assets/StaffImages/Chunk1.png");
        img.resize(width,0);
       img2 = loadImage("assets/hand.png");
        // temp_x = x;
}
boolean show = true;


int handX = 700;
int handY = 700;
int handWidth = 300;
int handheight = 400;
void drawStaff(){
        if (this.show) {
                imageMode(CORNERS);
                // rect(0,this.y, width, this.height);
                image(img, x, y);
                imageMode(CORNER);
                image(img2,handX,handY,handWidth,handheight);
        }
        if (DEBUG) {
                text(("STAFF - show:" + show + ",x & y" + str(x) + str(y) + ",height: " + height), 20, 20);
        }
}
void loadpic(String path){
        img = loadImage(path);
        img.resize(width,0);
}
}
