

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
                // if (i == 0) {
                //         notes[i].highlightNote(true, #000000);
                // }
                println(notes[i].highlightColor,notes[i].highlight );
        }
}
void displayNotes() {
        for( int i = 0; i < this.arraySize; i++ ) {
                notes[i].drawNote();
        }
}

void loadChunk(int[] chunk)  {
        for ( int i = 0; i < chunk.length; i++) {

                notes[chunk[i]].highlightNote(true, #FF0000);
        }
}

}
