
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

Staff staff;


int timerCount = 0;
SoundFile file;
SoundFile speak1, speak2, speak3;
void setup() {

        speak1 = new SoundFile(this, "speak/speak4.wav");
        speak2 = new SoundFile(this, "speak/speak2.wav");
        speak3 = new SoundFile(this, "speak/speak3.wav");
        file  = new SoundFile(this, "sample.wav");
        size(1000,1000);
        setupTimer();
        staff = new Staff(50., 200);
        noteManager = new NoteManager(36, 24,3);
        loadSamples();
        MidiBus.list();
        myKeyboard = new MidiBus(this,0,1); // parent, input, output (see console for listed midi in/outs) // http://www.smallbutdigital.com/docs/themidibus/themidibus/MidiBus.html
// INSTANCE OF THE SinOsc, which is a sine wave oscillator.
        SINE = new SinOsc(this);
        // THIS, IS ENVELOPE = THE CONTROL OF VOLUME (DIGITAL AUDIO IS A LOT OF DIGITS BETWEEN -1. AND 1      , making the soundwaves. YOU CONTROL THE VOLUME BY MULTIPLYING THE WAVE FROM 0. ( NO SOUND) TO 1( ABOVE 1 THEN it's becoming larger than it originally was (these sine are prolly maxed out, but soundfiles might not)). the envelope part comes in, it's volume control over time. ASR, Attack, how  )
        ENV = new Env(this);
        noteManager.setUI("hellloooo");


}
int channel = 0;
int pitch = 64;
int velocity = 127;
void draw(){


        myKeyboard.sendNoteOn(channel, pitch, velocity);
        background(255);
        staff.drawStaff();

        noteManager.displayNotes(true);
        // myKeyboard.controllerChange();


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
void controllerChange(int channel, int number, int value) {
        // Here we print the controller number.
        println(number);
}
//

/*
   ██   ██ ███████ ██    ██ ██████   ██████   █████  ██████  ██████
   ██  ██  ██       ██  ██  ██   ██ ██    ██ ██   ██ ██   ██ ██   ██
   █████   █████     ████   ██████  ██    ██ ███████ ██████  ██   ██
   ██  ██  ██         ██    ██   ██ ██    ██ ██   ██ ██   ██ ██   ██
   ██   ██ ███████    ██    ██████   ██████  ██   ██ ██   ██ ██████
 */


void noteOn(int channel, int pitch, int velocity) {
// println("LO");
        // Receive a noteOn
        // println();
        println("Note On:");
        // println("--------");
        // println("Channel:"+channel);
        println("Pitch:"+pitch);
        // println("Velocity:"+velocity);
        // midi(pitch);
        // I DUNNO WHY I CAN'T PARSE ARGUMENTS.
        playSample(pitch);
        // midi(pitch);
}

void noteOff(int channel, int pitch, int velocity) {
        // Receive a noteOff

        println();
        println("Note Off:");
        // println("--------");
        // println("Channel:"+channel);
        println("Pitch:"+pitch);
        // println("Velocity:"+velocity);
        stopSample(pitch);
}
void midi(int p){
        print(p);
        // if ( + > p - noteManager.valueOffset) {
                noteManager.notes[(p - noteManager.valueOffset)].onMIDI(p);
        // }
        // for (SoundFile s : samles) {
        //     s.update();
        //     mod.display();
        //   }

}


void playSample(int p){
        // file.play();
        // if (p - noteManager.valueOffset > noteManager.valueOffset) {
                SoundFile sample = samples.get((p - noteManager.valueOffset));
                sample.play();
        // }
}

void stopSample(int p){
        // file.stop();
        // if (p - noteManager.valueOffset > noteManager.valueOffset) {
                SoundFile sample = samples.get((p - noteManager.valueOffset));
                sample.stop();
        // }
}
