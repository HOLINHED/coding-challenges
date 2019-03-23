import java.util.List;
import java.util.ArrayList;

Player player;
List<Block> blocks;

void setup() {
  size(401,401);
  
  blocks = new ArrayList<Block>();
  
  for (int y = 0; y < (height-1)/40; y++) {
    for (int x = 0; x < (width-1)/40; x++) {
      if (random(1) < 0.24)
        blocks.add(new Block(x * 40, y * 40));
    }
  }
  
  player = new Player(width/2, height/2, blocks);
}

void draw() {
  background(150);
  
  for (Block block : blocks) {
    block.draw();
  }
  
  player.update();
  player.draw();
}
