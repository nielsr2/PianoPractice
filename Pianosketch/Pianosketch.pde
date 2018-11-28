// TODO make sharps into a separate array ( or otherwise differentiate ) and check that for clicks first
// TODO implement noloop, to reduce cpu.


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
Staff staff;
TimedEventGenerator noteTimer;
int countTimer = 0;
void setup() {
        size(1000,1000);

        img = loadImage("assets/piano2.png");
        img.resize(width,0);
        
        testManager.spreadOut();
        testManager.loadChunk("assets/chunkAll.csv");
        SINE = new SinOsc(this);
        ENV = new Env(this);
        noteTimer = new TimedEventGenerator(this,"timedPlaying", false);
        noteTimer.setIntervalMs(500);
        // float freq = 2^((52-69)/12)*440;
        // println(freq);
        //
        // sine.set(freq,0.5,0.0,1);
        // sine.play();
        testManager.displayNotes(true);
        staff = new Staff(float(width/4*3), 0.);
}

void draw(){
        // TODO setup pic properly
        staff.drawStaff();
        imageMode(CENTER);
        image(img,width/2,height/2);
        testManager.displayNotes(true);

}
void mouseClicked(){
        testManager.click(mouseX, mouseY);

};


void timedPlaying(){
        println("countTimer: ",countTimer, "testManager.currentChunk.length: ", testManager.currentChunk.length);
        if (countTimer < (testManager.currentChunk.length - 1)) {
                // println("yup");
                testManager.playTone(testManager.currentChunk[countTimer]);
                testManager.notes[testManager.currentChunk[countTimer] - testManager.valueOffset].animateNote();
                countTimer++;
                // testManager.notes[(testManager.currentChunk[countTimer] - testManager.valueOffset)].animateNote();
        }
        else {
                noteTimer.setEnabled(false);
                // println("noppppe");
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
