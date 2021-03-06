


class Note {
PImage overlay; // not used;
float x;
float y;
float noteWidth;
float noteHeight;
int keyValue;
boolean highlightActive = false;
boolean isBlack = true;


Note(float temp_x,float temp_y, float temp_width, float temp_height, int temp_keyValue, boolean black){

        this.x = temp_x;
        this.y = temp_y;
        this.noteWidth = temp_width;
        this.noteHeight = temp_height;
        this.keyValue =  temp_keyValue;
        this.isBlack = black;


}


float highlightOpacity = 125;
boolean animate = false;
void animateNote(){
      // println(this.keyValue + "was animated!!!!");
        this.animate = true;
        this.highlightOpacity = 255;
}


void drawNote(){

        stroke(0);
        // note
        fill(#FFFFFF, 255);
        if (isBlack) {
                fill(#444444, 255);
        }
        rect(this.x,this.y,this.noteWidth,this.noteHeight);

        //  overlay
        if (this.animate) {
                this.highlightOpacity += -10.;
                // println("this.highlightOpacity: ", this.highlightOpacity);
                if (this.highlightOpacity < 125) {
                        animate = false;
                }
        }
        // fill(this.highlightColor, this.highlightOpacity);

        if (this.highlight && noteManager.highlightAll) {
                fill(this.highlightColor,this.highlightOpacity);
                if (noteManager.greyHighlight==true){
                  fill(#CCCCCC);
                }
        }

        rect(this.x,this.y,this.noteWidth,this.noteHeight);
        if (DEBUG) {
                // text("x: " + x + ",y: " + y +);
                fill(255/2);
                text(("keyValue: " + keyValue + "highlight: " + highlight + "highlightColor: " +  highlightColor + "highlightOpacity: " + highlightOpacity), x, y, noteWidth, noteHeight);

        }

        if (this.animate) {
                fill(200,this.highlightOpacity-50);
                rect(this.x,this.y,this.noteWidth,this.noteHeight);
              }



}

// use this to set highlight boo + colour
boolean highlight;
color highlightColor = #FFFFFF;
void highlightNote(boolean temp_highlight, int temp_highlightColor){
        this.highlightActive = true;
        this.highlight = temp_highlight;
        this.highlightColor = temp_highlightColor;

}

// called from noteManager using a for loop on notes array.
boolean checkClick(float mouse_x, float mouse_y){
        if (mouse_x > this.x && mouse_x < (this.x + this.noteWidth) && mouse_y > this.y && mouse_y < this.y + (this.noteHeight) ) {
                // println("key hit, value was ", this.keyValue);
                playSample(this.keyValue);
                // this.playTone();
                this.animateNote();
                if (noteManager.sequence) {
                        noteManager.isNextNote(this.keyValue);
                }
                else
                {
                        noteManager.isAnyNote(this.keyValue);
                }
                return true;
        }
        else {
                return false;
        }
}
/*
███    ███     ██     ██████      ██
████  ████     ██     ██   ██     ██
██ ████ ██     ██     ██   ██     ██
██  ██  ██     ██     ██   ██     ██
██      ██     ██     ██████      ██
*/
void onMIDI(int value){
  // this.playTone();
  this.animateNote();
  if (noteManager.sequence) {
          noteManager.isNextNote(this.keyValue);
  }
  else

  {

  }
}

}
