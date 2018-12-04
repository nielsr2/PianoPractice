class FlowManager {
String[] chunks;
int chunkCounter = 1;

FlowManager(int howManyChunks){
  staff = new Staff(50., 200);
        // println("flowmanger inited");
        chunks = new String[howManyChunks];
        for (int i = 0; i < howManyChunks; i++) {


                chunks[i] = giveCSVpath(i);

        }
        this.stepOne();
}

void stepOne(){
        noteManager.loadChunk(giveCSVpath(chunkCounter));
        staff.show = true;
        // noteManager.playChunk();
}
String giveCSVpath(int count){
  String folder = "assets/chunk";
  String ext = ".csv";
  String path = folder + chunkCounter + ext;
  return path;
}
}
