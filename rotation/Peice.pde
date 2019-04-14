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
      for (int i = 0; i < data.length; i++) {
         for (int j = 0; j < data[0].length; j++) {
            if (data[i][j] == '*') {
               rect((x + j) * SCALE, (y + i) * SCALE, SCALE, SCALE);
            }
         }
      }
   }
   
   void rotate90() {
      char[][] rot = new char[4][4];
      for (int x = 0; x < data[0].length; x++) {
         for (int y = 0; y < data.length; y++) {
            rot[y][x] = data[x][(data.length - 1) - y];
         }
      }
      data = rot;
   }
   
   void rotate90neg() {
      char[][] rot = new char[4][4];
      for (int x = 0; x < data[0].length; x++) {
         for (int y = 0; y < data.length; y++) {
            rot[y][x] = data[(data[0].length - 1) - x][y];
         }
      }
      data = rot;
   }

}
