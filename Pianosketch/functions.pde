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
                noteManager.playChunk();
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
                        i++;
                        // println("File is still playing after " + i + " seconds");
                } else {
                        break;
                }
        }
}

// SoundFile[] samples = new SoundFile[noteManager.arraySize];
ArrayList<SoundFile> samples = new ArrayList<SoundFile>();
void loadSamples(){
        // [] samples = new SoundFile(this, "test");



        String[] noteNames = {"C","C#","D","D#","E","F","F#","G","G#","A","A#","B"};
        int octave  = 0;
        for (int i = 0; i < noteManager.arraySize; i++) {
                int octaveStep = i % 12;
                println(octaveStep);

                if (octaveStep == 0) {
                        octave++;
                };
                samples.add(new SoundFile(this, noteNames[octaveStep] + octave + ".wav"));
                println(noteNames[(octaveStep)] + octave + ".wav");
                // samples[i] = new SoundFile(this, noteNames[octaveStep-1] + octave + ".wav");


        }
        printArray(samples);
}
