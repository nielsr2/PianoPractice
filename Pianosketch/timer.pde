TimedEventGenerator noteTimer;
void timedPlaying(){
        println("timerCount: ",timerCount, "noteManager.currentChunk.length: ", noteManager.currentChunk.length);
        if (timerCount < (noteManager.currentChunk.length - 1)) {
                // println("playing note in chunk, count is ", timerCount);
                noteManager.playTone(noteManager.currentChunk[timerCount]);
                noteManager.notes[noteManager.currentChunk[timerCount] - noteManager.valueOffset].animateNote();
                timerCount++;
        }
        else {
                noteTimer.setEnabled(false);
                // println("chunk empty, timer stopped");
        }
}

void setupTimer(){
  noteTimer = new TimedEventGenerator(this,"timedPlaying", false);
  noteTimer.setIntervalMs(500);
}
