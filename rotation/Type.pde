import java.util.Random;

enum Type {

   I(new char[][] {
      {' ',' ',' ',' '},
      {' ',' ',' ',' '},
      {'*','*','*','*'},
      {' ',' ',' ',' '},
   }, "33FCFF"),
   L1(new char[][] {
      {' ',' ',' ',' '},
      {'*',' ',' ',' '},
      {'*','*','*',' '},
      {' ',' ',' ',' '},
   }, "0000ff"),
   L2(new char[][] {
      {' ',' ',' ',' '},
      {' ',' ','*',' '},
      {'*','*','*',' '},
      {' ',' ',' ',' '},
   }, "FFA200"),
   O(new char[][] {
      {' ',' ',' ',' '},
      {' ','*','*',' '},
      {' ','*','*',' '},
      {' ',' ',' ',' '},
   }, "FFFB00"),
   S(new char[][] {
      {' ',' ',' ',' '},
      {' ','*','*',' '},
      {'*','*',' ',' '},
      {' ',' ',' ',' '},
   }, "3AFF00"),
   Z(new char[][] {
      {' ',' ',' ',' '},
      {' ','*','*',' '},
      {' ',' ','*','*'},
      {' ',' ',' ',' '},
   }, "ff0000"),
   T(new char[][] {
      {' ',' ',' ',' '},
      {' ',' ','*',' '},
      {' ','*','*','*'},
      {' ',' ',' ',' '},
   }, "AA00FF"),
   ;

   final char[][] data;
   final String Color;
   
   private Type(char[][] data, String Color) {
      this.data = data;
      this.Color = Color;
   }
   
   public static Type getRandom() {
      Random random = new Random();
      return values()[random.nextInt(values().length)];
   }

}
