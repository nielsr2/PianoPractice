// https://atom.io/packages/processing


class Note {
PImage overlay; // not used;
float x;
float y;
float noteWidth;
float noteHeight;
int keyValue;
boolean highlightActive = false;
boolean isSharp = true;
boolean debug = true;
// SinOsc sine;
// SoundFile sound;
Note(float temp_x,float temp_y, float temp_width, float temp_height, int temp_keyValue, boolean sharp){

        this.x = temp_x;
        this.y = temp_y;
        this.noteWidth = temp_width;
        this.noteHeight = temp_height;
        this.keyValue =  temp_keyValue;
        this.isSharp = sharp;
        // println(keyValue);
        // this.sound = SoundFile(this, "bla/piano" + this.keyValue + ".mp3");

}
//
void playTone(){
        // http://newt.phys.unsw.edu.au/jw/notes.html
        // TODO make freq a object property, so it's not calculated every damn time
        // TODO also, playTone from MAnager or note???? not even sure what it does now...
        float test = float(this.keyValue + noteManager.valueOffset);
        println(2^(this.keyValue-69/12));
        // float freq = 2.^((this.keyValue-69)/12)*440.;
        float freq = pow(2,(test-69)/12);
        freq = freq*440.;
        println(freq, keyValue);

        SINE.set(freq,0.5,0.0,1);
        SINE.play();
        ENV.play(SINE,0.01,0.004,0.2,0.2);
        // env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
}

float highlightOpacity = 100;
boolean animate = false;
void animateNote(){
        this.animate = true;
        this.highlightOpacity = 200.;
}


void drawNote(){

        stroke(0);
        // note
        fill(#FFFFFF, 255);
        if (isSharp) {
                fill(#000000, 255);
        }
        rect(this.x,this.y,this.noteWidth,this.noteHeight);

        //  overlay
        if (this.animate) {
                this.highlightOpacity += -10.;
                // println("this.highlightOpacity: ", this.highlightOpacity);
                if (this.highlightOpacity < 100) {
                        animate = false;
                }
        }
        // fill(this.highlightColor, this.highlightOpacity);

        if (this.highlight && noteManager.highlightAll) {
                fill(this.highlightColor,this.highlightOpacity);
        }
        rect(this.x,this.y,this.noteWidth,this.noteHeight);
        if (debug) {
                // text("x: " + x + ",y: " + y +);
                fill(255/2);
                text(("keyValue: " + keyValue), x, y, noteWidth, noteHeight);
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

                this.playTone();
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
  this.playTone();
  this.animateNote();
  if (noteManager.sequence) {
          noteManager.isNextNote(this.keyValue);
  }
  else
  {
          noteManager.isAnyNote(this.keyValue);
  }
}

}
// TODO implement colorMode(mode)
