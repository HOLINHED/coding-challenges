using System;

namespace Game {

   class Board {

      private char[,] state;
      private int dim;
      private int size;

      public Board(int size) {

         dim = size;

         // initializes the state
         state = new char[dim, dim];

         // sets each spot in the array to an empty charater ' ' 
         for (int y = 0; y < 3; y++)
            for (int x = 0; x < 3; x++)
               state[x, y] = ' ';

         // sets size to 0. this tracks how many moves have been made to the board
         // so far.
         size = 0;
      }

      // Makes a move on the board. Does not check wheter the move is valid
      public void makePlay(int x, int y, char symbol) {
         state[y, x] = symbol;
         size += 1;
      }

      // Checks whether a specific move is valid. A move is valid when that spot
      // contains an empty character
      public Boolean isValid(int x, int y) {
         return state[y,x] == ' ';
      }

      // checks whether the board is in a winning state for that specific symbol
      public Boolean checkWinner(char symbol) {

         // sets the size for cleaner code
         int size = dim;
         
         // sets trackers for diagonals. don't reset because there are 
         // only two setss
         int bToken = 0, fToken = 0;

         // iterates through each row
         for (int y = 0; y < size; y++) {

            // sets trackers for rows and columns. Reset because there are multiple rows
            // and columns
            int xToken = 0, yToken = 0;

            // checks forward diagonal
            if (state[y, y] == symbol) fToken += 1;

            // inverses diagonal digonal X direction
            int r = (size - 1) - y;

            // checks backward diagonal
            if (state[r, y] == symbol) bToken += 1;

            // checks each column / row
            for (int x = 0; x < size; x++) {

               // checks row
               if (state[x, y] == symbol) xToken += 1;

               // checks column
               if (state[y, x] == symbol) yToken += 1;
            }

            // if any trackers are equal to the size, that mean the board is in a winning state
            if (bToken == size || fToken == size || xToken == size || yToken == size)
               return true;
         }

         // if passes through loop without returning, the board is not in a winning state
         return false;
      }

      // checks wheter the board is full or not
      public Boolean isFull() {
         return size == dim * dim;
      }

      // prints out the state of the board
      public String toString() {

         String board = "";

         for (int x = 0; x < dim; x++) {
            board += "|";
            for (int y = 0; y < dim; y++) {
               board += " " + state[x,y] + " |";
            }
            board += "\n";
         }

         return board;
      }

   }

}