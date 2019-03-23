import java.util.List;

class Player {

  private int x;
  private int y;
  private List<Block> blocks;
  
  Player(int x, int y, List<Block> blocks) {
    this.x = x;
    this.y = y;
    
    this.blocks = blocks;
  }
  
  void draw() {
    
    for (double a = 0; a < TWO_PI; a+= TWO_PI / 200) {
      int r = 0;
      
      float dx = x;
      float dy = y;
      
      while (r < 100) {
        
        final float vx = cos((float)a);
        final float vy = sin((float)a);
      
        dx += vx;
        dy += vy;
        
        r += 1;
        
        for (Block block : blocks) {
          if (block.collide(dx,dy)) r = 100;
        }
      
      }
      
      line(x, y, dx, dy);
    }
    
    ellipse(x, y, 10, 10);
  }
  
  void update() {
    x = mouseX;
    y = mouseY;
  }

}
