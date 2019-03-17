class Tile {
  
  private int x;
  private int y;
  private int size;
  private boolean revealed;
  private boolean bee;
  private Tile[][] board;

  Tile(int x, int y, int size, Tile[][] board) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.board = board;
    
    revealed = false;
    
    bee = random(1) < 0.35;
  }
  
  void draw() {
    
    if (revealed) {
      if (!bee) 
        fill(0,255,0);
      else 
        fill(255,0,0);
    } else {
      fill(255);
    }
  
    rect(x,y,size,size);
  }
  
  boolean isBee() {
    return bee;
  }
  
  boolean isRevealed() {
    return revealed;
  }
  
  void reveal() {
    
    revealed = true;
    
    final int X = x / size;
    final int Y = y / size;
    
    final int x1 = X - 1 > -1 ? X - 1 : 0;
    final int y1 = Y - 1 > -1 ? Y - 1 : 0;
    final int x2 = X + 1 < board.length ? X + 1 : board.length - 1;
    final int y2 = Y + 1 < board.length ? Y + 1 : board.length - 1;
    
    for (int y = y1; y <= y2; y++) {
      for (int x = x1; x <= x2; x++) {
        if (!board[x][y].isRevealed()) {
          if (board[x][y].isBee() == bee) {
            board[x][y].reveal();
          }
        }
      }
    }
  }
}
