class Staff {
float x;
float y;
int staffHeight;
PImage img;
Staff( float temp_y, int temp_staffHeight) {
        this.y = temp_y;
        this.staffHeight = temp_staffHeight;
        img = loadImage("assets/staff.png");
        img.resize(0,this.staffHeight);
        // temp_x = x;

}
boolean show = false;
void drawStaff(){
        if (!this.show) {
                rect(0,this.y, width, this.staffHeight);
                imageMode(CORNERS);
                image(img, x, y);
        }
}
void loadpic(int chunkInt){
        img = loadImage("assets/staff" + chunkInt + ".png");
        img.resize(0,this.staffHeight);
}

}
