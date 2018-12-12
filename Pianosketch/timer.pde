

TimedEventGenerator noteTimer;
int prevNote;
void timedPlaying(){

        int sizeOfChunk = noteManager.currentChunk2.size();
        if (timerCount < sizeOfChunk) {
                int keyValue = noteManager.currentChunk2.get(timerCount);
                if (prevNote != 0)
                {
                        stopSample(prevNote);
                }
                playSample(keyValue);

                noteManager.notes[keyValue - noteManager.valueOffset].animateNote();
                prevNote = keyValue;
                timerCount++;
                println("timerCount: ",timerCount, "noteManager.currentChunk.length: ", sizeOfChunk );
        }
        else {
                noteTimer.setEnabled(false);
                noteManager.step += 1;
                noteManager.nextStep();
                // println("chunk empty, timer stopped");
        }
}

void setupTimer(){
        noteTimer = new TimedEventGenerator(this,"timedPlaying", false);
        noteTimer.setIntervalMs(500);
}
