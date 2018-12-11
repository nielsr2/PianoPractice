// function for interpreting int for finger from CSV to colour
int fingerColor(int finger){
        if (finger == 1) {
                return #FF0000;
        }
        else if (finger == 2) {
                return #EBEB00;
        }
        else if (finger == 3) {
                return #00FF68;
        }
        else if (finger == 4) {
                return #0063FF;
        }
        else if (finger == 5) {
                return #CF00FF;
        }
        else {
                return #000000;
        }
}

String giveCSVpath(int count){
        String folder = "assets/chunk";
        String ext = ".csv";
        String path = folder + count + ext;
        return path;
}


void keyPressed() {
        if (key == TAB) {
                println("YASS");
            if    (DEBUG) {
                  DEBUG = false;
                }
                else {
                  DEBUG = true;
                };
        }
        if (key == ENTER) {
          noteManager.playChunk();
                // playSample();
                // println("YASS");
                // printArray(noteManager.currentChunk);
                // for( int i = 0; i < noteManager.arraySize; i++ ) {
                //         println(i, noteManager.notes[i].highlightOpacity);
                // }

        }
}


void playNfreeze(SoundFile audio) {
        audio.play();
        int i = 0;
        while (true) {
                delay(1000);
                if (audio.isPlaying()) {
                        // i++;
                        // // println("File is still playing after " + i + " seconds");
                } else {
                        break;
                }
        }
}
