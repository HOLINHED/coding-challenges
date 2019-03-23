class Block {
  
  private int x;
  private int y;

  Block(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void draw() {
  
    rect(x, y, 40, 40);
  }
  
  boolean collide(float x, float y) {
    return (x > this.x && x < this.x + 40) && (y > this.y && y < this.y + 40);
  }


}
