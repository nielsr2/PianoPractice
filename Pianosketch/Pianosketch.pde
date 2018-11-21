PImage img;


// Note testNote = new Note(20,30,40,50);

NoteManager testManager = new NoteManager(24);
void setup() {
size(1000,1000);

img = loadImage("assets/piano.jpg");
testManager.spreadOut();

}

void draw(){
image(img,0,400);
// testNote.drawNote();
testManager.displayNotes();

}
