class FlowManager {
String[] chunks;
int chunkCounter = 1;
int step = 1;
FlowManager(int howManyChunks){

        // println("flowmanger inited");
        chunks = new String[howManyChunks];
        for (int i = 0; i < howManyChunks; i++) {
                chunks[i] = giveCSVpath(i);
        }
        // this.stepOne();
}

void stepOne(){
        noteManager.highlightAll = true;
        noteManager.loadChunk(giveCSVpath(chunkCounter));
        staff.show = true;
        delay(500);
        noteManager.playChunk();
}
void stepThree(){
        noteManager.highlightAll = true;
        noteManager.loadChunk(giveCSVpath(chunkCounter));
        staff.show = true;
}
String giveCSVpath(int count){
        String folder = "assets/chunk";
        String ext = ".csv";
        String path = folder + chunkCounter + ext;
        return path;
}
boolean ui;
String message = "bah";
void setUI(String temp_message){
        this.message = temp_message;
        this.ui = true;
}
void drawUI(){
        if (this.ui) {
                background(0);
                fill(255,255/2);
                rectMode(CENTER);
                rect(width/2,height/5*2, width/2, height/2);
                fill(0);
                textMode(CENTER);
                text(this.message,width/2, height/2);
                // noLoop();
        }
}
}
