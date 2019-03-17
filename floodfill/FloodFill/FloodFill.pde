final static int TILE_SIZE = 25;

Tile[][] tiles;

void setup() {
  
  size(501,501);
  
  final int WIDTH = (width - 1) / 25;
  final int HEIGHT = (height - 1) / 25;
  
  tiles = new Tile[WIDTH][HEIGHT];
  
  for (int y = 0; y < WIDTH; y++) {
    for (int x = 0; x < HEIGHT; x++) {
      tiles[x][y] = new Tile(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, tiles);
    }
  }
}

void draw() {
  background(50);

  for (Tile[] row : tiles) {
    for (Tile tile : row) {
      tile.draw();
    }
  }
}

void mousePressed() {

  final int x = mouseX / TILE_SIZE;
  final int y = mouseY / TILE_SIZE;
  
  tiles[x][y].reveal();
}
