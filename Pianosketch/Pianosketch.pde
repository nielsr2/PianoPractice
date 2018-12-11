// LIBRARIES we use
import org.multiply.processing.*; // for event timer https://kapeli.com/dash_share?path=http://multiply.org/processing/
import processing.sound.*; // playing sound
import themidibus.*; // MidiBus

PImage pianoBackground;

MidiBus myKeyboard;

SinOsc SINE;
Env ENV;

NoteManager noteManager;

Staff staff;


int timerCount = 0;
SoundFile file;
SoundFile startremark, speakStep1, speakStep2, speakStep3, speakStep4, finalremark;
void setup() {
         startremark = new SoundFile(this, "speak/startremark.wav");
        speakStep1 = new SoundFile(this, "speak/step1.wav");
        speakStep2 = new SoundFile(this, "speak/step2.wav");
        speakStep3 = new SoundFile(this, "speak/step3.wav");
        speakStep4 = new SoundFile(this, "speak/step4.wav");
        finalremark = new SoundFile(this, "speak/finalremark.wav");
        // file  = new SoundFile(this, "sample.wav");
        size(1000,1000);
        setupTimer();
        staff = new Staff(50., 200);
        noteManager = new NoteManager(36, 24,3);
        loadSamples();
        MidiBus.list();
        myKeyboard = new MidiBus(this,0,1); // parent, input, output (see console for listed midi in/outs) // http://www.smallbutdigital.com/docs/themidibus/themidibus/MidiBus.html

        noteManager.setUI("hellloooo");


}
int channel = 0;
int pitchD = 64;
int velocity = 127;
void draw(){


        // myKeyboard.sendNoteOn(channel, pitch, velocity);
        background(255);
        staff.drawStaff();

        noteManager.displayNotes(true);
        // myKeyboard.controllerChange();
text(pitchD, width/4*3, height/4*3);
// println(pitchD);

}
void mouseClicked(){
        if (noteManager.ui) {
                noteManager.ui = false;
                if (noteManager.step == 1) {
                        noteManager.nextStep();
                }
        }
        else
        {
                noteManager.click(mouseX, mouseY);
        }
};
