class Note {

PImage overlay;
float x;
float y;
float noteWidth;
float noteHeight;
int keyValue;

Note(float temp_x,float temp_y, float temp_width, float temp_height){
        this.x = temp_x;
        this.y = temp_y;
        this.noteWidth = temp_width;
        this.noteHeight = temp_height;
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
void highlightNote(boolean temp_highlight, color temp_highlightColor){
        this.highlight = temp_highlight;
        this.highlightColor = temp_highlightColor;
}

}
int pressed = 0;
Void noteHit (){
void mouseClicked() {
if( pressed == 0) {
pressed = 1;
else {
  pressed == 0;

  if (pressed == 1 && mouseX >this.x && < noteWidth && mouseY > this.y && < noteHeight) {
println(JA TJAAAAK);

  }
}
}

}

}
// if (whereuat == "crossway" && mouseX > (ClabsPosX - (ClabsWidth/2)) && mouseX < (ClabsPosX + (ClabsWidth/2))
//   && mouseY > (ClabsPosY - (ClabsHeight/2)) && mouseY < (ClabsPosY + (ClabsHeight/2))) {
//   println("Labs");
//   stream.load(bridgeStream, "labs");
// }
