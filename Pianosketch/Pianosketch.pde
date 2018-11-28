// TODONE make sharps into a separate array ( or otherwise differentiate ) and check that for clicks first √ works now
// TODO implement noloop, to reduce cpu.

// LIBRARIES we use
import org.multiply.processing.*; // for event timer
import processing.sound.*; // playing sound
import themidibus.*; // MidiBus

PImage pianoBackground;

MidiBus myKeyboard;

SinOsc SINE;
Env ENV;

NoteManager noteManager = new NoteManager(36, 24);
Staff staff;

TimedEventGenerator noteTimer;
int timerCount = 0;
void setup() {
        size(1000,1000);

        pianoBackground = loadImage("assets/piano2.png");
        pianoBackground.resize(width,0);

        noteManager.spreadOut();
        noteManager.loadChunk("assets/chunk1.csv");

        SINE = new SinOsc(this);
        ENV = new Env(this);

        noteTimer = new TimedEventGenerator(this,"timedPlaying", false);
        noteTimer.setIntervalMs(500);
        noteManager.displayNotes(true);
        staff = new Staff(50., 200);
}

void draw(){
        // TODO setup pic properly
        staff.drawStaff();
        imageMode(CENTER);
        image(pianoBackground,width/2,height/2);
        noteManager.displayNotes(true);

}
void mouseClicked(){
        noteManager.click(mouseX, mouseY);
};


void timedPlaying(){
        println("timerCount: ",timerCount, "noteManager.currentChunk.length: ", noteManager.currentChunk.length);
        if (timerCount < (noteManager.currentChunk.length - 1)) {
                // println("playing note in chunk, count is ", timerCount);
                noteManager.playTone(noteManager.currentChunk[timerCount]);
                noteManager.notes[noteManager.currentChunk[timerCount] - noteManager.valueOffset].animateNote();
                timerCount++;
        }
        else {
                noteTimer.setEnabled(false);
                // println("chunk empty, timer stopped");
        }
}
