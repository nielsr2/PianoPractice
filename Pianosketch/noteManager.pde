// TODO make delay longer
// TODO speech
// TODO make chunk CSV, make two versions noobs/pro MIKKEL
// TODO fri-leg til sidst
// TODO fix note highlight
// TODO fingering pic, and make colors fit with function for int
// TODO HAND
// TODO AUDIO SAMPLES IMPLEMENTERES
// TODO STAFF CODE
// animate yellow looks weird blame mikkel


//


class NoteManager {
int arraySize, valueOffset;
Note[] notes;
// sinOsc sine;
boolean highlightAll = false;
boolean greyHighlight = false;
boolean debug = true;
boolean sequence = false;

String[] chunks;
int chunkCounter = 1;
int step = 1;
NoteManager(int notesArraySize, int noteValueOffset, int howManyChunks) {
        chunks = new String[howManyChunks];
        for (int i = 0; i < howManyChunks; i++) {
                chunks[i] = giveCSVpath(i);
        }
        valueOffset = noteValueOffset;
        arraySize = notesArraySize;
        notes = new Note[arraySize];
        spreadOut();
        // printArray(notes);


        // printArray(notes  .highlightColor);
}
void nextStep(){
        if (this.step == 0 ) {
                chunkCounter++;
                this.step++;
                this.clearHighlights();

                // this.nextStep();
        }
        if (this.step == 1) {
                println("STEP1");
                 this.sequence = true;

                // while (speak1.isPlaying()) {
                //   println("HAHAHA");
                // }

                println("DONE......");
                this.highlightAll = true;
                this.loadChunk(giveCSVpath(chunkCounter));

                staff.show = true;
                // delay(1000);
                if (chunkCounter == 1) {
                        playNfreeze(startremark);
                }
                if (chunkCounter == 2) {
                        playNfreeze(speakStep4);
                }
                this.playChunk();
        }
        if (this.step == 2 ) {
                println("STEP2");
                // this.setUI("yas no sequence");
                this.sequence = true;
                // this.highlightNext();
                playNfreeze(speakStep1);
        }
        if (this.step == 3 ) {
                println("STEP3");
                this.loadChunk(giveCSVpath(chunkCounter));
                // this.setUI("SEQUENCE!!!!");
                this.sequence = true;
                this.greyHighlight= true;
                this.highlightNext();
                playNfreeze(speakStep2);

        }
        if (this.step == 4 ) {
                println("STEP4");
                staff.show = false;
                this.highlightAll = false;
                if (this.chunkCounter == 2) {
                  this.sequence = false;
                        playNfreeze(finalremark);
                }
                else
                {this.loadChunk(giveCSVpath(chunkCounter));
                 this.highlightNext();
                 playNfreeze(speakStep3);}


                println("asdfasdf");
                // this.setUI("SEQUENCE!!!!");
                // this.sequence = true;

        }
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
        rectMode(CORNER);
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
        this.drawUI();
        if (debug) {
                fill(255/2);
                // String strCurrentChunk = join(nf(currentChunk, 0), ", ");
                text(("manager - current chunk" + currentChunk2 + ", arraySize" + arraySize + "offset: " + valueOffset + "step" + this.step + "countChunk" + chunkCounter), 0, 900);
        }
}

/*
   ██           ██████       █████      ██████           ██████     ██   ██     ██    ██     ███    ██     ██   ██
   ██          ██    ██     ██   ██     ██   ██         ██          ██   ██     ██    ██     ████   ██     ██  ██
   ██          ██    ██     ███████     ██   ██         ██          ███████     ██    ██     ██ ██  ██     █████
   ██          ██    ██     ██   ██     ██   ██         ██          ██   ██     ██    ██     ██  ██ ██     ██  ██
   ███████      ██████      ██   ██     ██████           ██████     ██   ██      ██████      ██   ████     ██   ██
 */


IntList currentChunk2 = new IntList();
void loadChunk(String csvfile)  {
        Table chunkFromCSV = loadTable(csvfile, "header"); // header, cuz our csv-files has headers (value, finger)

        for ( int i = 0; i < chunkFromCSV.getRowCount(); i++) {
                //println(chunkFromCSV.getInt(i,0), chunk.getInt(i,1));

                // set notes
                notes[chunkFromCSV.getInt(i, "value") - valueOffset].highlightNote(true, fingerColor(chunkFromCSV.getInt(i,1)));
                // set the 'chunkFromCSV' for managing
                currentChunk2.append(chunkFromCSV.getInt(i, "value"));

        }
        println("chunk loaded :");
        highlightNext();
        printArray(currentChunk2);
}
/*
                    ██     ███████                 ███    ██  ██████  ████████ ███████
                    ██     ██                      ████   ██ ██    ██    ██    ██
                    ██     ███████                 ██ ██  ██ ██    ██    ██    █████
                    ██          ██                 ██  ██ ██ ██    ██    ██    ██
                    ██     ███████                 ██   ████  ██████     ██    ███████
 */


// when note is pressed, this is called to check if it's the correct note in the sequence)
boolean isNextNote(int noteValue) {

        if (noteValue == currentChunk2.get(0)) {

                currentChunk2.remove(0);

                if (currentChunk2.size() == 0) {

                        println("array empty");
                        this.step += 1;
                        if (this.step == 5) {
                                this.step = 0;
                        }
                        this.nextStep();
                } else {
                        highlightNext();
                }

                return true;
        }
        else {
                return false;
        }
}

boolean isAnyNote(int noteValue) {

        for (int i = 0; i < currentChunk2.size(); i++ ) {
                if (noteValue == currentChunk2.get(i)) {
                        currentChunk2.remove(i);
                        i -= 1; // if we remove an element, we need to take that into account
                }
        }
        if (currentChunk2.size() == 0) {
                this.step += 1;
                this.nextStep();
        }
        return true;
}

/*
   ██████ ██      ██  ██████ ██   ██
   ██      ██      ██ ██      ██  ██
   ██      ██      ██ ██      █████
   ██      ██      ██ ██      ██  ██
   ██████ ███████ ██  ██████ ██   ██
 */


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



/*
   ██    ██     ██
   ██    ██     ██
   ██    ██     ██
   ██    ██     ██
   ██████      ██
 */






boolean ui;
String message = "bah";
void setUI(String temp_message){
        this.message = temp_message;
        this.ui = true;
}
void drawUI(){
        if (this.ui) {
                // TODO MAKE THIS PRETTY
                // background(0);
                // fill(255,255/2);
                // rectMode(CENTER);
                // rect(width/2,height/5*2, width/2, height/2);
                // // fill(255/2);
                // textMode(CENTER);
                // text(this.message,width/2, height/2);
                // noLoop();
        }
}

/*
   ██   ██ ██  ██████  ██   ██ ██      ██  ██████  ██   ██ ████████
   ██   ██ ██ ██       ██   ██ ██      ██ ██       ██   ██    ██
   ███████ ██ ██   ███ ███████ ██      ██ ██   ███ ███████    ██
   ██   ██ ██ ██    ██ ██   ██ ██      ██ ██    ██ ██   ██    ██
   ██   ██ ██  ██████  ██   ██ ███████ ██  ██████  ██   ██    ██
 */


void clearHighlights(){
        for( int i = 0; i < this.arraySize; i++ ) {
                notes[i].highlight = false;
        }
}

void highlightNext(){
        int next = this.currentChunk2.get(0) - this.valueOffset;
        this.notes[next].highlightOpacity = 255.;
}

}
