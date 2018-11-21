PImage img;

Note testnote;
testnote = new testnote(20,30,40,50);


void setup() {
size(1000,1000);

img = loadImage("assets/piano.jpg");

}

void draw(){
image(img,0,400);
testnote.drawNote;


}
