class StaffAndHand {
float x;
float y;
// int height;
PImage img;
PImage img2;
StaffAndHand( float temp_y, int temp_height) {
        this.y = temp_y;
        // this.height = temp_height;
        img = loadImage("assets/StaffImages/Chunk1.png");
        img.resize(width,0);
       img2 = loadImage("assets/hand.png");
        // temp_x = x;
}
boolean show = true;


float handX = height*0.7;
float handY = height*0.7;
float handWidth = height*0.3;
float handheight = height*0.4;
void drawStaffAndHand(){
        if (this.show) {
                imageMode(CORNERS);
                // rect(0,this.y, width, this.height);
                image(img, x, y);
                imageMode(CORNER);
                image(img2,handX,handY,handWidth,handheight);
        }
        if (DEBUG) {
                text(("STAFF - show:" + show + ",x & y" + str(x) + str(y) + ",height: " + height), 20, 20);
                // text(("HAND - show:" + show + ",x & y" + str(handX) + str(handY) + ",height: " + handWidth), 20, 40);
        }
}
void loadpic(String path){
        img = loadImage(path);
        img.resize(width,0);
}
}
