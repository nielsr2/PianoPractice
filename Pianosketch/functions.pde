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

String giveCSVpath(int count){
        String folder = "assets/chunk";
        String ext = ".csv";
        String path = folder + count + ext;
        return path;
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
