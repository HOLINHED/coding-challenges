class Peice {
   
   private int x;
   private int y;
   private int fill;
   private char[][] data;
   
   Peice(int x, int y) {
      this.x = x;
      this.y = y;
      
      Type r = Type.getRandom();
      
      fill = Integer.parseInt(r.Color, 16);
      
      data = r.data;
      
   }
   
   void draw() {
      fill(red(fill),green(fill),blue(fill));
      for (int i = 0; i < 4; i++) {
         for (int j = 0; j < 4; j++) {
            if (data[i][j] == '*') {
               rect((x + j) * SCALE, (y + i) * SCALE, SCALE, SCALE);
            }
         }
      }
   }
   
   void rotate90() {
      char[][] rot = new char[4][4];
      for (int x = 0; x < 4; x++) {
         for (int y = 0; y < 4; y++) {
            rot[y][x] = data[x][3 - y];
         }
      }
      data = rot;
   }
   
   void rotate90neg() {
      char[][] rot = new char[4][4];
      for (int x = 0; x < 4; x++) {
         for (int y = 0; y < 4; y++) {
            rot[y][x] = data[3 - x][y];
         }
      }
      data = rot;
   }

}
