import themidibus.*;

PImage img;
boolean DEBUG = true;
MidiBus myKeyboard;
// Note testNote = new Note(20,30,40,50);

NoteManager testManager = new NoteManager(24);
void setup() {
        size(1000,1000);
        MidiBus.list();
        myKeyboard = new MidiBus(this,0,1); // parent, input, output (see console for listed midi in/outs) // http://www.smallbutdigital.com/docs/themidibus/themidibus/MidiBus.html
        img = loadImage("assets/piano2.png");
        testManager.spreadOut();
        testManager.loadChunk("assets/chunk1.csv");
}

void draw(){

        image(img,0,400);
// testNote.drawNote();

        testManager.displayNotes();

}
void mouseClicked(){
        testManager.click(mouseX, mouseY);

};

void controllerChange(int channel, int number, int value) {
        // Here we print the controller number.
        println(number);
}
