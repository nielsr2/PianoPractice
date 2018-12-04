class FlowManager {
String[] chunks;
int chunkCounter = 1;
FlowManager(int howManyChunks){
        // println("flowmanger inited");
        chunks = new String[howManyChunks];
        for (int i = 0; i < howManyChunks; i++) {
                String folder = "/assets/chunk";
                String ext = ".csv";
                String path = folder + (i + 1) + ext;
                chunks[i] = path;
                println(folder);
        }
}

void loadNext(String path){
        noteManager.loadChunk(path);
}
}
