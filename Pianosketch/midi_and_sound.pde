
void controllerChange(int channel, int number, int value) {
        // Here we print the controller number.
        println(number);
}
//

/*
   ██   ██ ███████ ██    ██ ██████   ██████   █████  ██████  ██████
   ██  ██  ██       ██  ██  ██   ██ ██    ██ ██   ██ ██   ██ ██   ██
   █████   █████     ████   ██████  ██    ██ ███████ ██████  ██   ██
   ██  ██  ██         ██    ██   ██ ██    ██ ██   ██ ██   ██ ██   ██
   ██   ██ ███████    ██    ██████   ██████  ██   ██ ██   ██ ██████
 */


void noteOn(int channel, int pitch, int velocity) {
// println("LO");
        // Receive a noteOn
        // println();
        println("Note On:");
        // println("--------");
        // println("Channel:"+channel);
        println("Pitch:"+pitch);
        pitchD = pitch;
        // println("Velocity:"+velocity);
        // midi(pitch);
        // I DUNNO WHY I CAN'T PARSE ARGUMENTS.
        if (pitch > noteManager.valueOffset || pitch < noteManager.valueOffset + noteManager.arraySize) {
                playSample(pitch);
                midi(pitch);
        }
}

void noteOff(int channel, int pitch, int velocity) {
        // Receive a noteOff

        println();
        println("Note Off:");
        // println("--------");
        // println("Channel:"+channel);
        println("Pitch:"+pitch);
        // println("Velocity:"+velocity);
        if (pitch > noteManager.valueOffset || pitch < noteManager.valueOffset + noteManager.arraySize) {
                stopSample(pitch);
        }
}
void midi(int p){
        // println("p: ", p, "p - noteManager.valueOffset: ", p - (noteManager.valueOffset ) , "noteManager.valueOffset: ", noteManager.valueOffset);
        // println(noteManager.notes[p - noteManager.valueOffset].keyValue);
        // println(noteManager.notes[(p - noteManager.valueOffset)].keyValue);
        // if ( + > p - noteManager.valueOffset) {
        if (noteManager.step != 1)
        {        println("p: ", p, "p-offset: ", p - noteManager.valueOffset);
                 noteManager.notes[(p - noteManager.valueOffset)].onMIDI(p);} // }
                                                                              // for (SoundFile s : samles) {
                                                                              //     s.update();
                                                                              //     mod.display();
                                                                              //   }

}


void playSample(int p){
        // file.play();
        // if (p - noteManager.valueOffset > noteManager.valueOffset) {
        println("p: ", p, "p-offset: ", p - noteManager.valueOffset);
        SoundFile sample = samples.get((p - noteManager.valueOffset));
        sample.amp(0.5);
        sample.play();
        // }
}

void stopSample(int p){
        // file.stop();
        // if (p - noteManager.valueOffset > noteManager.valueOffset) {
        SoundFile sample = samples.get((p - noteManager.valueOffset));
        sample.amp(0.5);
        sample.stop();
        // }
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

// are we 100 % sure we can't do this without ArrayList
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
