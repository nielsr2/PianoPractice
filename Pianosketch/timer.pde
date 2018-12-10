TimedEventGenerator noteTimer;
void timedPlaying(){
        println("timerCount: ",timerCount, "noteManager.currentChunk.length: ", noteManager.currentChunk2.size());
        if (timerCount < (noteManager.currentChunk2.size())) {
                // println("playing note in chunk, count is ", timerCount);
                playSample(noteManager.currentChunk2.get(timerCount));
                noteManager.notes[noteManager.currentChunk2.get(timerCount) - noteManager.valueOffset].animateNote();
                timerCount++;
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
