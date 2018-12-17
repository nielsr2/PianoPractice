
/*
   ██   ██ ███████ ██    ██ ██████   ██████   █████  ██████  ██████
   ██  ██  ██       ██  ██  ██   ██ ██    ██ ██   ██ ██   ██ ██   ██
   █████   █████     ████   ██████  ██    ██ ███████ ██████  ██   ██
   ██  ██  ██         ██    ██   ██ ██    ██ ██   ██ ██   ██ ██   ██
   ██   ██ ███████    ██    ██████   ██████  ██   ██ ██   ██ ██████
 */
int pitchDebug;
void noteOn(int channel, int pitch, int velocity) {
// println("LO");
        // Receive a noteOn
        // println();
        println("Note On:");
        // println("--------");
        // println("Channel:"+channel);
        println("Pitch:"+pitch);
        pitchDebug = pitch;
        // println("Velocity:"+velocity);
        // midi(pitch);
        // I DUNNO WHY I CAN'T PARSE ARGUMENTS.
        if (pitch > noteManager.valueOffset || pitch < noteManager.valueOffset + noteManager.arraySize) {
                playSample(pitch);
                noteManager.midi(pitch);
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
