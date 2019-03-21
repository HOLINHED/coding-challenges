// WORK IN PROGRESS

import java.util.ArrayList;
import java.util.List;

List<Shape> blocks;

void setup() {
  size(600,600);
  
  blocks = new ArrayList<Shape>();
  
  blocks.add(new Shape(createRect(width/2,height/2,100), 100, 0));
  blocks.add(new Shape(createRect(30,30,200), 200, 0));
}

void draw() {
  background(255);
  
  for(Shape block : blocks) {
    block.draw();
  }
  
  boolean collide = blocks.get(0).isColliding(blocks.get(1)) || blocks.get(1).isColliding(blocks.get(0));
  
  fill(0);
  text("Colliding: " + collide, 20, 20);
}

void keyPressed() {
  switch(keyCode) {
    case 37:blocks.get(0).setV(-7,0);break;
    case 38:blocks.get(0).setV(0,-7);break;
    case 39:blocks.get(0).setV(7,0);break;
    case 40:blocks.get(0).setV(0,7);break;
    case 65:blocks.get(1).setV(-7,0);break;
    case 87:blocks.get(1).setV(0,-7);break;
    case 68:blocks.get(1).setV(7,0);break;
    case 83:blocks.get(1).setV(0,7);break;
  }
}

void keyReleased() {
  switch(keyCode) {
    case 37:blocks.get(0).setV(0,0);break;
    case 38:blocks.get(0).setV(0,0);break;
    case 39:blocks.get(0).setV(0,0);break;
    case 40:blocks.get(0).setV(0,0);break;
    case 65:blocks.get(1).setV(0,0);break;
    case 87:blocks.get(1).setV(0,0);break;
    case 68:blocks.get(1).setV(0,0);break;
    case 83:blocks.get(1).setV(0,0);break;
  }
}
