using System;

namespace Game {

   class Board {

      private char[,] state;
      private int dim;
      private int size;

      public Board(int size) {

         dim = size;

         state = new char[dim, dim];

         for (int y = 0; y < 3; y++)
            for (int x = 0; x < 3; x++)
               state[x, y] = ' ';

         size = 0;
      }

      public void makePlay(int x, int y, char symbol) {
         state[y, x] = symbol;
         size += 1;
      }

      public Boolean isValid(int x, int y) {
         return state[y,x] == ' ';
      }

      public Boolean checkWinner(char symbol) {

         int bToken = 0, fToken = 0;
         int size = dim;

         for (int y = 0; y < size; y++) {

            int xToken = 0, yToken = 0;

            if (state[y, y] == symbol) fToken += 1;

            int r = (size - 1) - y;
            if (state[r, y] == symbol) bToken += 1;

            for (int x = 0; x < size; x++) {

               if (state[x, y] == symbol) xToken += 1;

               if (state[y, x] == symbol) yToken += 1;
            }

            if (bToken == size || fToken == size || xToken == size || yToken == size)
               return true;
         }

         return false;
      }

      public Boolean isFull() {
         return size == dim * dim;
      }

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