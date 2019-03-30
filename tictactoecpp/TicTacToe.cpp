#include <string>
#include <iostream>

struct State {
   int plays;
   bool turn;
   bool running;
   char board[9];
};

bool checkWinner(char* board, char symbol) {

   const int length = 3;

   int fToken = 0;
   int bToken = 0;

   for (int x = 0; x < length; x++) {

      int xToken = 0; 
      int yToken = 0;

      if (board[(x * 3) + x] == symbol) fToken += 1;

      const int r = (length - 1) - x;
      if (board[(x * 3) + r] == symbol) bToken += 1;

      for (int y = 0; y < length; y++) {

         if (board[(y * length) + x] == symbol) yToken += 1;

         if (board[(x * length) + y] == symbol) xToken += 1;

         if (xToken == length || yToken == length || 
            fToken == length || bToken == length) return true;

      }

   }

   return false;
}

int main(void) {
   
   State game;

   // Initial state
   game.turn = true;
   game.running = true;
   game.plays = 0;

   std::string winner = "NONE";

   // gets size of board array
   const int length = sizeof(game.board) / sizeof(game.board[0]);

   // Fill board array with empty character
   for (int i = 0; i < length; i++) {
      game.board[i] = ' ';
   }

   while(true) {

      // ends game if board is full
      if (game.plays > length) break;

      printf("Turn: %s\n\n", game.turn ? "ONE" : "TWO");

      // print the current board state
      for (int i = 0; i < length; i++) {
         printf(" | %c", game.board[i]);
         if ((i + 1) % 3 == 0) printf(" |\n");
      }

      if (!game.running) break;

      // Get user input
      printf("\nEnter X position: ");
      
      int x;
      std::cin >> x;

      printf("Enter Y position: ");
      int y;
      std::cin >> y;

      // determines symbol based on who's turn it is
      const char symbol = game.turn ? 'X' : 'O';

      // makes move and changes turn if it's a valid move
      if (game.board[(y * 3) + x] == ' ' && x > -1 && y > -1 && y < 3 && x < 3) {
         game.board[(y * 3) + x] = symbol;
         game.turn = !game.turn;
         game.plays += 1;
      }

      // checks winner and stops game if winner found
      if (checkWinner(game.board, symbol)) {
         winner = symbol;
         game.running = false;
      }

   }

   printf("\nWINNER: %s\n", winner.c_str());

   return 0;
}