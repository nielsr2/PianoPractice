class Note {

PImage overlay;
float x;
float y;
float noteWidth;
float noteHeight;
int keyValue; 

Note(float temp_x,float temp_y, float temp_width, float temp_height){
        this.x = temp_x;
        this.y = temp_y;
        this.noteWidth = temp_width;
        this.noteHeight = temp_height;
}

void drawNote(){
        stroke(0);
        fill(#FFFFFF);
        if (this.highlight) {
                fill(this.highlightColor,100);
        }

        rect(this.x,this.y,this.noteWidth,this.noteHeight);
}

// use this to set highlight boo + colour
boolean highlight;
color highlightColor;
void highlightNote(boolean temp_highlight, color temp_highlightColor){
        this.highlight = temp_highlight;
        this.highlightColor = temp_highlightColor;
}

}



class NoteManager {
int arraySize;
Note[] notes;
NoteManager(int NotesArraySize) {
        arraySize = NotesArraySize;
        notes = new Note[arraySize];
        spreadOut();
        // printArray(notes.highlightColor);
}

void spreadOut(){
        for( int i = 0; i < this.arraySize; i++ ) {
                println(i);
                notes[i] = new Note(i*20,30, 40, 40);
                if (i == 0) {
                        println("tasss");
                        notes[i].highlightNote(true, #000000);
                }
                println(notes[i].highlightColor,notes[i].highlight );
        }
}
void displayNotes() {
        for( int i = 0; i < this.arraySize; i++ ) {
                notes[i].drawNote();
        }
}


}
