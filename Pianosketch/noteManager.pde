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
                // println(i);
                notes[i] = new Note(i*20,30, 20, 40, i);
                // if (i == 0) {
                //         notes[i].highlightNote(true, #000000);
                // }
                // println(notes[i].x);
        }
}
void displayNotes() {
        for( int i = 0; i < this.arraySize; i++ ) {
                notes[i].drawNote();
        }
}

// void loadChunk(int[] chunk)  {
//         for ( int i = 0; i < chunk.length; i++) {
//                 notes[chunk[i]].highlightNote(true, #FF0000);
//         }
// }

int[] currentChunk;
void loadChunk(String csvfile)  {
  Table chunk = loadTable(csvfile, "header"); // header, cuz our csv-files has headers (value, finger)
  currentChunk = new int[chunk.getRowCount()];
        for ( int i = 0; i < chunk.getRowCount(); i++) {
                println(chunk.getInt(i,0), chunk.getInt(i,1));

                // set notes
                notes[chunk.getInt(i, "value")].highlightNote(true, this.fingerColor(chunk.getInt(i,1)));
                // set the 'chunk' for managing
                currentChunk[i] = chunk.getInt(i, "value");
        }
        printArray(currentChunk);
}
void click(float x, float y) {
        for( int i = 0; i < this.arraySize; i++ ) {
                notes[i].checkClick(x,y);
        }
}
int fingerColor(int finger){
  if (finger == 1) {
    return #FF0000;
  }
  else if (finger == 2) {
    return #F0FF00;
  }
  else if (finger == 3) {
    return #00FF00;
  }
  else if (finger == 4) {
    return #00FFF0;
  }
  else if (finger == 5) {
    return #0000FF;
  }
  else {
    return #000000;
  }
}


}
