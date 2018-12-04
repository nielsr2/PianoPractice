class NoteManager {
int arraySize, valueOffset;
Note[] notes;
// sinOsc sine;
boolean highlightAll = false;
boolean debug = true;
NoteManager(int notesArraySize, int noteValueOffset) {
        valueOffset = noteValueOffset;
        arraySize = notesArraySize;
        notes = new Note[arraySize];
        spreadOut();
        // printArray(notes);

        MidiBus.list();
        myKeyboard = new MidiBus(this,0,1); // parent, input, output (see console for listed midi in/outs) // http://www.smallbutdigital.com/docs/themidibus/themidibus/MidiBus.html
        // printArray(notes  .highlightColor);
}
void playTone(int keyValue){
        // http://newt.phys.unsw.edu.au/jw/notes.html
        float test = float(keyValue + this.valueOffset);

        // float freq = 2.^((this.keyValue-69)/12)*440.;
        float freq = pow(2,(test-69)/12);
        freq = freq*440.;
        println(freq, keyValue);

        SINE.set(freq,0.5,0.0,1);
        SINE.play();
        ENV.play(SINE,0.1,0.004,0.3,0.4);
}
void playChunk(){
        timerCount = 0;
        noteTimer.setEnabled(true);
}

void spreadOut(){
        // TODO FIX THE MAGIC NUMBER 15 ( 5 sharps per octave, over 3 octaves, 15)
        // println("width:", width/(this.arraySize-15));
        int offsetCount = 0;
        int offsetSharpCount = 0;
        float noteHeight = 300;
        float noteWidth = width/float(this.arraySize-15);
        for( int i = 0; i < this.arraySize; i++ ) {

                int step = (i + 1) % 12;
                // println(step);

                if (step == 2 ||
                    step == 4 ||
                    step ==7 ||
                    step == 9 ||
                    step == 11 ) {
                        // println("exception");
                        notes[i ] = new Note(offsetSharpCount*(noteWidth/2) + (noteWidth/4),height/3,
                                             noteWidth/2, noteHeight*0.6, (valueOffset + i), true);
                        if (step == 4) {
                                offsetSharpCount++;
                        }
                        if (step == 11) {
                                offsetSharpCount++;
                        }
                        offsetSharpCount++;

                }
                else {
                        notes[i] = new Note(offsetCount*((width/float(this.arraySize-15))),
                                            height/3, noteWidth, noteHeight, (valueOffset + i), false);
                        offsetCount++;
                        offsetSharpCount++;
                }
        }

}
void displayNotes(boolean displayAll) {
        if (displayAll) {
                for( int i = 0; i < this.arraySize; i++ ) {
                        if(!notes[i].isSharp)
                        {
                                notes[i].drawNote();
                        }
                }
                for( int i = 0; i < this.arraySize; i++ ) {
                        if(notes[i].isSharp)
                        {
                                notes[i].drawNote();
                        }
                }
        }
        if (debug) {
                // String strCurrentChunk = join(nf(currentChunk, 0), ", ");
                text(("manager - current chunk" + currentChunk2 + ", arraySize" + arraySize + "offset: " + valueOffset), 0, 900);
        }
}

IntList currentChunk2 = new IntList();
void loadChunk(String csvfile)  {
        Table chunkFromCSV = loadTable(csvfile, "header"); // header, cuz our csv-files has headers (value, finger)
        currentChunk = new int[chunkFromCSV.getRowCount()];
        for ( int i = 0; i < chunkFromCSV.getRowCount(); i++) {
                //println(chunkFromCSV.getInt(i,0), chunk.getInt(i,1));

                // set notes
                notes[chunkFromCSV.getInt(i, "value") - valueOffset].highlightNote(true, this.fingerColor(chunkFromCSV.getInt(i,1)));
                // set the 'chunkFromCSV' for managing
                currentChunk2.append(chunkFromCSV.getInt(i, "value"));
                currentChunk[i] = chunkFromCSV.getInt(i, "value");
        }
        println("chunk loaded :");
        printArray(currentChunk2);
}
// when note is pressed, this is called to check if it's the correct note in the sequence)
boolean isNextNote(int noteValue) {

        if (noteValue == currentChunk2.get(0)) {
                currentChunk2.remove(0);
                if (currentChunk2.size() == 0) {
                        println("array empty");
                }

                return true;
        }
        else {
                return false;
        }
}

boolean isAnyNote(int noteValue) {

  for (int i = 0; i < currentChunk2.size(); i++ ) {
    if (noteValue == currentChunk2.get(i)){
      currentChunk2.remove(i);
      i -= 1; // if we remove an element, we need to take that into account
    }
  }
  if (currentChunk2.size() == 0) {
          println("array empty");
  }
  return true;
}
void click(float x, float y) {

        //  this whole if-shenanigan is about black keys vs white keys. Since black keys are above the white ones, we want to check those first cuz overlaps
        boolean found = false;
        for( int i = 0; i < this.arraySize; i++ ) {
                if (notes[i].isSharp)
                {
                        // println("yess, playing natural");
                        if (notes[i].checkClick(x,y)) {
                                found = true;
                        }
                        ;
                }
        }
        if (!found) {
                for( int i = 0; i < this.arraySize; i++ ) {
                        if (!notes[i].isSharp)
                        {
// println("yess, playing sharp");
                                notes[i].checkClick(x,y);
                        }

                }
        }

}
// function for interpreting int for finger from CSV to colour
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
void controllerChange(int channel, int number, int value) {
        // Here we print the controller number.
        println(number);
}


}

void keyPressed() {
        if (key == TAB) {
                println("YASS");
                noteManager.playChunk();
        }
        if (key == ENTER) {
                // println("YASS");
                // printArray(noteManager.currentChunk);
                // for( int i = 0; i < noteManager.arraySize; i++ ) {
                //         println(i, noteManager.notes[i].highlightOpacity);
                // }

        }
}
