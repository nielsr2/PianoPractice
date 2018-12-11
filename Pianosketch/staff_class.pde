class Staff {
float x;
float y;
int staffHeight;
PImage img;
PImage img2;
Staff( float temp_y, int temp_staffHeight) {
        this.y = temp_y;
        this.staffHeight = temp_staffHeight;
        img = loadImage("assets/StaffImages/Chunk1.png");
        img.resize(width,0);
       img2 = loadImage("assets/hand.png");
        // temp_x = x;
}
boolean show = true;
boolean debug = false;
int staffHandX = 700;
int staffHandY = 700;
int staffHandWidth = 300;
int staffHandheight = 400;
void drawStaff(){
        if (this.show) {
                imageMode(CORNERS);
                // rect(0,this.y, width, this.staffHeight);
                image(img, x, y);
                imageMode(CORNER);
                image(img2,staffHandX,staffHandY,staffHandWidth,staffHandheight);
        }
        if (this.debug) {
                text(("STAFF - show:" + show + ",x & y" + str(x) + str(y) + ",height: " + staffHeight), 20, 20);
        }
}
void loadpic(String path){
        img = loadImage(path);
        img.resize(width,0);
}
}
