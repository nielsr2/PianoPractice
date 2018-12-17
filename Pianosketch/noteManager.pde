

class NoteManager {
int arraySize, valueOffset;
Note[] notes;
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
this.greyHighlight = false;
          // if (this.chunkCounter == 1) {
          //   staffAndHand.loadpic("assets/StaffAndHandImages/Chunk1.png");
          // }
          if (this.chunkCounter == 2) {
            staffAndHand.loadpic("assets/StaffImages/Chunk2.png");
          }


                println("STEP1");
                 this.sequence = true;


                        staffAndHand.show = true;

                println("DONE......");
                this.highlightAll = true;
                this.loadChunk(giveCSVpath(chunkCounter));

                staffAndHand.show = true;
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
                //this.highlightAll = false;

                staffAndHand.loadpic("assets/StaffImages/Staff.png");

                this.greyHighlight = true;
                playNfreeze(speakStep2);

        }
        if (this.step == 4 ) {
                println("STEP4");
                staffAndHand.show = false;
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
        int offsetCount = 0;
        int offsetBlackCount = 0;
        float noteHeight = height*0.3;
        int howManyOctaves = this.arraySize/12;
        int howManyBlacks = 5*howManyOctaves;

        float noteWidth = width/float(this.arraySize-howManyBlacks);

        for( int i = 0; i < this.arraySize; i++ ) {

                int step = (i + 1) % 12;
                // println(step);
                if (step == 2 ||
                    step == 4 ||
                    step == 7 ||
                    step == 9 ||
                    step == 11 ) {
                        // println("exception");
                        notes[i] = new Note(offsetBlackCount*(noteWidth/2) + (noteWidth/4),height/3,
                                             noteWidth/2, noteHeight*0.6, (valueOffset + i), true);
                        if (step == 4) {
                                offsetBlackCount++;
                        }
                        if (step == 11) {
                                offsetBlackCount++;
                        }
                        offsetBlackCount++;

                }
                else {
                        notes[i] = new Note(offsetCount*((width/float(this.arraySize-howManyBlacks))),
                                            height/3, noteWidth, noteHeight, (valueOffset + i), false);
                        offsetCount++;
                        offsetBlackCount++;
                }
        }
}


void drawNotes(boolean displayAll) {
        rectMode(CORNER);
        if (displayAll) {
                for( int i = 0; i < this.arraySize; i++ ) {
                        if(!notes[i].isBlack)
                        {
                                notes[i].drawNote();
                        }
                }
                for( int i = 0; i < this.arraySize; i++ ) {
                        if(notes[i].isBlack)
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


void checkClicks(float x, float y) {

        //  this whole if-shenanigan is about black keys vs white keys. Since black keys are above the white ones, we want to check those first cuz overlaps
        boolean found = false;
        for( int i = 0; i < this.arraySize; i++ ) {
                if (notes[i].isBlack)
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
                        if (!notes[i].isBlack)
                        {
// println("yess, playing black");
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




// this is not used for displaying anything, but it's kept as it something

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
        this.notes[next].highlightOpacity = 255;
}


// M I D I

void midi(int p){

        if (this.step != 1)
        {        println("p: ", p, "p-offset: ", p - this.valueOffset);
                 this.notes[(p - this.valueOffset)].onMIDI(p);} // }
}
}
