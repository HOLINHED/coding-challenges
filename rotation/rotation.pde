static final int SCALE = 25;

Peice peice;

void setup() {
   size(600,600);
   
   peice = new Peice(11,5);
}

void draw() {
   background(21);
   
   peice.draw();
}

void keyPressed() {
   switch(keyCode){
      case 37: peice.rotate90();break;
      case 39: peice.rotate90neg();break;
   }
}
