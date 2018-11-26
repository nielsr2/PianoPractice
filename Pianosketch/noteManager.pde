class NoteManager {
int arraySize, valueOffset;
Note[] notes;
// sinOsc sine;

NoteManager(int notesArraySize, int noteValueOffset) {
        arraySize = notesArraySize;
        notes = new Note[arraySize];
        spreadOut();
        printArray(notes);
        valueOffset = noteValueOffset;
        MidiBus.list();
        myKeyboard = new MidiBus(this,0,1); // parent, input, output (see console for listed midi in/outs) // http://www.smallbutdigital.com/docs/themidibus/themidibus/MidiBus.html
        // printArray(notes  .highlightColor);
}
void playTone(int keyValue){
        // http://newt.phys.unsw.edu.au/jw/notes.html
        float test = float(keyValue);

        // float freq = 2.^((this.keyValue-69)/12)*440.;
        float freq = pow(2,(test-69)/12);
        freq = freq*440.;
        println(freq, keyValue);

        SINE.set(freq,0.5,0.0,1);
        SINE.play();
        ENV.play(SINE,0.1,0.004,0.3,0.4);
        // delay(250);
        // SINE.stop();
}
void playChunk(){
        for( int i = 0; i < currentChunk.length; i++ ) {
                this.playTone(currentChunk[i]);
                notes[currentChunk[i] - valueOffset].animateNote();
                delay(300);

        }
}

void spreadOut(){
        for( int i = 0; i < this.arraySize; i++ ) {
                
                notes[i] = new Note(i*20,30, 20, 40, valueOffset + i);
        }
}
void displayNotes() {
        for( int i = 0; i < this.arraySize; i++ ) {
                notes[i].drawNote();
        }
}
int[] currentChunk;
void loadChunk(String csvfile)  {
        Table chunk = loadTable(csvfile, "header"); // header, cuz our csv-files has headers (value, finger)
        currentChunk = new int[chunk.getRowCount()];
        for ( int i = 0; i < chunk.getRowCount(); i++) {
                println(chunk.getInt(i,0), chunk.getInt(i,1));

                // set notes
                notes[chunk.getInt(i, "value") - valueOffset].highlightNote(true, this.fingerColor(chunk.getInt(i,1)));
                // set the 'chunk' for managing
                currentChunk[i] = chunk.getInt(i, "value");
        }
        // printArray(currentChunk);
}
// when note is pressed, this is called to check if it's the correct note in the sequence)
boolean isNextNote(int noteValue) {
        if (noteValue == currentChunk[currentChunk.length - 1]) {
                int[] temp_currentChunk = new int[currentChunk.length - 1];
                for ( int i = 0; i < (currentChunk.length - 1); i++) {
                        temp_currentChunk[i] = currentChunk[i];
                }
                currentChunk = temp_currentChunk;
                printArray(currentChunk);
                if (currentChunk.length == 0) {
                        println("array empty!!");
                        // TODO do something
                }
                return true;
        }
        else {
                return false;
        }
}
void click(float x, float y) {
        for( int i = 0; i < this.arraySize; i++ ) {
                notes[i].checkClick(x,y);
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
                testManager.playChunk();
        }
}
