import org.multiply.processing.*;

import processing.sound.*;

import themidibus.*;
PImage img;
boolean DEBUG = true;
MidiBus myKeyboard;
// Note testNote = new Note(20,30,40,50);
SinOsc SINE;
Env ENV;
NoteManager testManager = new NoteManager(36, 24);

TimedEventGenerator noteTimer;
int countTimer = 0;
void setup() {
        size(1000,1000);

        img = loadImage("assets/piano2.png");
        img.resize(width,0);
        imageMode(CENTER);
        testManager.spreadOut();
        testManager.loadChunk("assets/chunkAll.csv");
        SINE = new SinOsc(this);
        ENV = new Env(this);
        noteTimer = new TimedEventGenerator(this,"onTimerEvent2", false);
        noteTimer.setIntervalMs(250);
        // float freq = 2^((52-69)/12)*440;
        // println(freq);
        //
        // sine.set(freq,0.5,0.0,1);
        // sine.play();
        testManager.displayNotes(true);
}

void draw(){
        // TODO setup pic properly
        image(img,width/2,height/2);
        testManager.displayNotes(true);

}
void mouseClicked(){
        testManager.click(mouseX, mouseY);

};


void onTimerEvent2(){
        println("countTimer: ",countTimer, "testManager.currentChunk.length: ", testManager.currentChunk.length);
        if (countTimer < testManager.currentChunk.length) {
                println("yup");
                testManager.playTone(testManager.currentChunk[countTimer]);
                testManager.notes[testManager.currentChunk[countTimer] - testManager.valueOffset].animateNote();
                countTimer++;
                testManager.notes[(testManager.currentChunk[countTimer] - testManager.valueOffset)].animateNote();
        }
        else {
                noteTimer.setEnabled(false);
                println("noppppe");
        }
        // for( int i = 0; i < currentChunk.length; i++ ) {
        //         this.playTone(currentChunk[i]);
        //         notes[currentChunk[i] - valueOffset].animateNote();
        //         // delay(300);
        //
        //
        // }
//}
}
