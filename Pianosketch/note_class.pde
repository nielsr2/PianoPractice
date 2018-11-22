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
}

// use this to set highlight boo + colour
boolean highlight;
color highlightColor;
void highlightNote(boolean temp_highlight, int temp_highlightColor){
        this.highlight = temp_highlight;
        this.highlightColor = temp_highlightColor;
}

// called from noteManager thru loop.
void checkClick(float mouse_x, float mouse_y){
        // mouse_x = int(mouse_x);
        // mouse_y = int(mouse_y);
        if (mouse_x > this.x && mouse_x < (this.x + this.noteWidth) && mouse_y > this.y && mouse_y < this.y + (this.noteHeight) ) {
                println(this.keyValue);
        }
}

}
