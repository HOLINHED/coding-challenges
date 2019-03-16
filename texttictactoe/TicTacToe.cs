using System;

namespace Game {

   class TicTacToe {
      
      private Board board;
      private Boolean turn;

      private Boolean running;

      private String winner;
      
      public TicTacToe() {
         
         // Initializes board
         board = new Board(3);

         // Sets both turn and tunning to true
         turn = running = true;
      }

      public static void Main() {
         
         // Makes new game instance
         TicTacToe game = new TicTacToe();

         // Main game loop
         while (game.running) {

            // Checks which player playing TRUE if X false if O
            char playing = game.turn ? 'X' : 'O';

            // Shows current state of board and which player's turn it is
            Console.WriteLine("\n" + playing + " TURN!\n");
            Console.WriteLine(game.board.toString());

            int x = -1;

            // Gets new X position from player while their input is not valid
            while (x < 0 || x > 3) {
               Console.Write("Enter x position: ");
               x = Convert.ToInt32(Console.ReadLine()) - 1;
            }

            int y = -1;

            // Gets new Y position from player while their input is not valid
            while (y < 0 || y > 3) {
               Console.Write("Enter y position: ");
               y = Convert.ToInt32(Console.ReadLine()) - 1;
            }

            // If the move they want to make is not valid, don't make the move. And that
            // player has to go again when the game loops.
            if (game.board.isValid(x,y)) {
               
               // change who's turn it is
               game.turn = !game.turn;

               // make the move
               game.board.makePlay(x,y,playing);
            
               // check if the move the player just made was a winning move, if so, stop the game
               // loop and set the winner.
               if (game.board.checkWinner(playing)) {
                  game.running = false;
                  game.winner = playing.ToString();
               }
               
               // if board is full and there was no winner, stop the game loop and set winner 
               // to NONE
               if (game.board.isFull() && game.running) { 
                  game.running = false;
                  game.winner = "NONE";
               }

               
            }
         }

         // Prints final state of board
         Console.WriteLine("\n" + game.board.toString());

         // Prints winner
         Console.WriteLine("WINNER: " + game.winner);
         
      }

   }

}