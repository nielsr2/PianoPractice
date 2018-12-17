
/*
██████      ██      █████      ███    ██      ██████              ███████      █████      ███    ███     ██████      ██          ███████     ███████
██   ██     ██     ██   ██     ████   ██     ██    ██             ██          ██   ██     ████  ████     ██   ██     ██          ██          ██
██████      ██     ███████     ██ ██  ██     ██    ██             ███████     ███████     ██ ████ ██     ██████      ██          █████       ███████
██          ██     ██   ██     ██  ██ ██     ██    ██                  ██     ██   ██     ██  ██  ██     ██          ██          ██               ██
██          ██     ██   ██     ██   ████      ██████              ███████     ██   ██     ██      ██     ██          ███████     ███████     ███████
*/


// are we 100 % sure we can't do this without ArrayList
// ArrayList<SoundFile> samples = new ArrayList<SoundFile>();
SoundFile[] samples = new SoundFile[36];
void loadSamples(){

        String[] noteNames = {"C","C#","D","D#","E","F","F#","G","G#","A","A#","B"};
        int octave  = 0;
        for (int i = 0; i < noteManager.arraySize; i++) {
                int octaveStep = i % 12;
                println(octaveStep);

                if (octaveStep == 0) {
                        octave++;
                };
                // samples.add(new SoundFile(this, noteNames[octaveStep] + octave + ".wav"));
                println(noteNames[(octaveStep)] + octave + ".wav");
                samples[i] = new SoundFile(this, noteNames[octaveStep] + octave + ".wav");
        }
        printArray(samples);
}

void playSample(int p){
        // println("p: ", p, "p-offset: ", p - noteManager.valueOffset);
        // SoundFile sample = samples.get((p - noteManager.valueOffset));
        samples[p - noteManager.valueOffset].amp(0.5);
        samples[p - noteManager.valueOffset].play();
}

void stopSample(int p){
        // SoundFile sample = samples.get((p - noteManager.valueOffset));
        // sample.amp(0.5);
        samples[p- noteManager.valueOffset ].stop();
}


/*
███████     ██████      ███████      █████      ██   ██
██          ██   ██     ██          ██   ██     ██  ██
███████     ██████      █████       ███████     █████
     ██     ██          ██          ██   ██     ██  ██
███████     ██          ███████     ██   ██     ██   ██
*/


SoundFile startremark, speakStep1, speakStep2, speakStep3, speakStep4, finalremark;
void loadSpeak(){
  startremark = new SoundFile(this, "speak/startremark.wav");
 speakStep1 = new SoundFile(this, "speak/step1.wav");
 speakStep2 = new SoundFile(this, "speak/step2.wav");
 speakStep3 = new SoundFile(this, "speak/step3.wav");
 speakStep4 = new SoundFile(this, "speak/step4.wav");
 finalremark = new SoundFile(this, "speak/finalremark.wav");
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
