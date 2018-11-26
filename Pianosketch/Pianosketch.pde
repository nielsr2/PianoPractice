import processing.sound.*;

import themidibus.*;
PImage img;
boolean DEBUG = true;
MidiBus myKeyboard;
// Note testNote = new Note(20,30,40,50);
SinOsc SINE;
Env ENV;
NoteManager testManager = new NoteManager(48, 24);
void setup() {
        size(1000,1000);

        img = loadImage("assets/piano2.png");
        testManager.spreadOut();
        testManager.loadChunk("assets/chunkAll.csv");
        SINE = new SinOsc(this);
        ENV = new Env(this);
        // float freq = 2^((52-69)/12)*440;
        // println(freq);
        //
        // sine.set(freq,0.5,0.0,1);
        // sine.play();
        
}

void draw(){
  // TODO setup pic properly
        image(img,0,400);
// testNote.drawNote();

        testManager.displayNotes();

}
void mouseClicked(){
        testManager.click(mouseX, mouseY);

};
