
// TODO implement noloop, to reduce cpu.
// TODO samples instead of synth
// TODO implement keyboard MIDI
//
// LIBRARIES we use
import org.multiply.processing.*; // for event timer
import processing.sound.*; // playing sound
import themidibus.*; // MidiBus

PImage pianoBackground;

MidiBus myKeyboard;

SinOsc SINE;
Env ENV;

NoteManager noteManager;
FlowManager flowManager;
Staff staff;


int timerCount = 0;
void setup() {
        size(1000,1000);
        setupTimer();
        staff = new Staff(50., 200);
        noteManager = new NoteManager(36, 24);

        flowManager = new FlowManager(3);

        // myKeyboard = new MidiBus(this, 0, 1);
// INSTANCE OF THE SinOsc, which is a sine wave oscillator.
        SINE = new SinOsc(this);
        // THIS, IS ENVELOPE = THE CONTROL OF VOLUME (DIGITAL AUDIO IS A LOT OF DIGITS BETWEEN -1. AND 1      , making the soundwaves. YOU CONTROL THE VOLUME BY MULTIPLYING THE WAVE FROM 0. ( NO SOUND) TO 1( ABOVE 1 THEN it's becoming larger than it originally was (these sine are prolly maxed out, but soundfiles might not)). the envelope part comes in, it's volume control over time. ASR, Attack, how  )
        ENV = new Env(this);
        flowManager.setUI("hellloooo");
}

void draw(){
        background(255);
        staff.drawStaff();

        noteManager.displayNotes(true);
        // myKeyboard.controllerChange();
        flowManager.drawUI();

}
void mouseClicked(){
        if (flowManager.ui) {
          flowManager.ui = false;
          if (flowManager.step == 1) {
            flowManager.stepOne();
          }
        }
        else
        {
                noteManager.click(mouseX, mouseY);
        }
};
