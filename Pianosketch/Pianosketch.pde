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
FlowManager flowManager;
Staff staff;

TimedEventGenerator noteTimer;
int timerCount = 0;
void setup() {
        flowManager = new FlowManager(3);
        size(1000,1000);

        pianoBackground = loadImage("assets/piano2.png");
        pianoBackground.resize(width,0);

        noteManager.spreadOut();
        noteManager.loadChunk("assets/chunkAll.csv");
        // myKeyboard = new MidiBus(this, 0, 1);
// INSTANCE OF THE SinOsc, which is a sine wave oscillator.
        SINE = new SinOsc(this);
        // THIS, IS ENVELOPE = THE CONTROL OF VOLUME (DIGITAL AUDIO IS A LOT OF DIGITS BETWEEN -1. AND 1      , making the soundwaves. YOU CONTROL THE VOLUME BY MULTIPLYING THE WAVE FROM 0. ( NO SOUND) TO 1( ABOVE 1 THEN it's becoming larger than it originally was (these sine are prolly maxed out, but soundfiles might not)). the envelope part comes in, it's volume control over time. ASR, Attack, how  )
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
        // myKeyboard.controllerChange();

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
