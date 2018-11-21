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
        // this.clicked();
        // && mouseX < this.y && mouseY > (this.y + this.noteHeight) && mouseX < this.x && mouseX > (this.x + this.noteWidth)
        // mouseY < this.y && mouseY > (this.y + this.noteHeight) &&
        // if (mousePressed && (mouseX < this.x && mouseX > (this.x + this.noteWidth))) {
        //         println(this);
        // }
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
//int pressed = 0;
// void noteHit (){
void clicked(){

}

}


// void mouseClicked() {
//         println(mouseX);
//           // this.x, mouseY, this.y);
//         // if( pressed == 0) {
//         //         pressed = 1;
//         // }
//         //  else {
//         //        pressed == 0;
//         //}
//         //
//         // if (mouseX > this.x && mouseX < noteWidth && mouseY > this.y && mouseY < noteHeight) {
//         //         println("JA TJAAAAK");
//         //
//         // }&& mouseX < this.y && mouseY > (this.y + this.noteHeight)
//         // if (mouseX < this.x && mouseX > (this.x + this.noteWidth) ) {
//         //         println("JA TJAAAAK2134");
//         // }
//         //   && mouseY > (ClabsPosY - (ClabsHeight/2)) && mouseY < (ClabsPosY + (ClabsHeight/2)))
//         // }
//
// }
// if (whereuat == "crossway" && mouseX > (ClabsPosX - (ClabsWidth/2)) && mouseX < (ClabsPosX + (ClabsWidth/2))
//   && mouseY > (ClabsPosY - (ClabsHeight/2)) && mouseY < (ClabsPosY + (ClabsHeight/2))) {
//   println("Labs");
//   stream.load(bridgeStream, "labs");
// }
