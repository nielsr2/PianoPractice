class Note {

PImage overlay;
float x;
float y;
float noteWidth;
float noteHeight;
int keyValue;
boolean active = false;
// SinOsc sine;
Note(float temp_x,float temp_y, float temp_width, float temp_height, int temp_keyValue, boolean sharp){
        this.x = temp_x;
        this.y = temp_y;
        this.noteWidth = temp_width;
        this.noteHeight = temp_height;
        this.keyValue =  temp_keyValue;
        this.isSharp = sharp;
        // sine = new SinOsc(PApplet);

        // this.drawNote();
}

void playTone(){
  // http://newt.phys.unsw.edu.au/jw/notes.html
  float test = float(this.keyValue + testManager.valueOffset);
  println(2^(this.keyValue-69/12));
  // float freq = 2.^((this.keyValue-69)/12)*440.;
  float freq = pow(2,(test-69)/12);
  freq = freq*440.;
  println(freq, keyValue);

  SINE.set(freq,0.5,0.0,1);
  SINE.play();
  ENV.play(SINE,0.01,0.004,0.2,0.2);
    // env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
  // delay(250);
  // SINE.stop();
}

float highlightOpacity = 100;
boolean animate = false;
void animateNote(){
  animate = true;
  println("tast");
  this.highlightOpacity = 255.;
  // while (this.highlightOpacity >= 0. ){
  //
  //   this.highlightOpacity = this.highlightOpacity - 10;
  //   // println("highlightOpacity: ", this.highlightOpacity, "value: ", this.keyValue );
  // }
}
boolean isSharp = true;
void drawNote(){
        stroke(0);
        if (animate) {
          if (this.highlightOpacity < 100){
            println("opca test");
            animate = false;
          }
          this.highlightOpacity -= -10;

        }

        fill(this.highlightColor, this.highlightOpacity);
        if (isSharp) {
          // stroke(255,0,0);
          fill(#000000, this.highlightOpacity);
        }
        if (this.highlight) {
                fill(this.highlightColor,this.highlightOpacity);
        }
        rect(this.x,this.y,this.noteWidth,this.noteHeight);
}

// use this to set highlight boo + colour
boolean highlight;
color highlightColor = #FFFFFF;
void highlightNote(boolean temp_highlight, int temp_highlightColor){
        this.active = true;
        this.highlight = temp_highlight;
        this.highlightColor = temp_highlightColor;
}

// called from noteManager thru loop.
void checkClick(float mouse_x, float mouse_y){
        // mouse_x = int(mouse_x);
        // mouse_y = int(mouse_y);
        if (mouse_x > this.x && mouse_x < (this.x + this.noteWidth) && mouse_y > this.y && mouse_y < this.y + (this.noteHeight) ) {
                println(this.keyValue);
                this.playTone();
                 this.animateNote();
                testManager.isNextNote(this.keyValue);
        }
}

}
