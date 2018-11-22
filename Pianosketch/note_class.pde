class Note {

PImage overlay;
float x;
float y;
float noteWidth;
float noteHeight;
int keyValue;

Note(float temp_x,float temp_y, float temp_width, float temp_height, int temp_keyValue){
        this.x = temp_x;
        this.y = temp_y;
        this.noteWidth = temp_width;
        this.noteHeight = temp_height;
        this.keyValue =  temp_keyValue;
}

void drawNote(){
        stroke(0);
        fill(#FFFFFF);
        if (this.highlight) {
                fill(this.highlightColor,100);
        }

        rect(this.x,this.y,this.noteWidth,this.noteHeight);

        if (mousePressed && mouseX > this.x && mouseX < (this.x + this.noteWidth) && mouseY > this.y && mouseY < (this.y + this.noteHeight) ) {
          println(this.keyValue);
        }
}

// use this to set highlight boo + colour
boolean highlight;
color highlightColor;
void highlightNote(boolean temp_highlight, color temp_highlightColor){
        this.highlight = temp_highlight;
        this.highlightColor = temp_highlightColor;
}
void clicked(){

}

}
