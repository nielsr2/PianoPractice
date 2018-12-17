// LIBRARIES we use
import org.multiply.processing.*; // for event timer https://kapeli.com/dash_share?path=http://multiply.org/processing/
import processing.sound.*; // playing sound
import themidibus.*; // MidiBus

PImage pianoBackground;

MidiBus myKeyboard;

NoteManager noteManager;

StaffAndHand staffAndHand;

boolean DEBUG;


void setup() {
        loadSpeak();
        size(600,600);
        setupTimer();
        staffAndHand = new StaffAndHand(50., 200);
        noteManager = new NoteManager(36, 24,3);
        loadSamples();
        // MidiBus.list(); //
        myKeyboard = new MidiBus(this,0,1); // parent, input, output (see console for listed midi in/outs) // http://www.smallbutdigital.com/docs/themidibus/themidibus/MidiBus.html
        noteManager.setUI("hellloooo");
}


void draw(){
        background(255);
        staffAndHand.drawStaffAndHand();
        noteManager.drawNotes(true);
        if (DEBUG) {
                text(pitchDebug, width/4*3, height/4*3);
        }
}
