using System;

namespace Game {

   class TicTacToe {
      
      private Board board;
      private Boolean turn;

      private Boolean running;

      private String winner;
      
      public TicTacToe() {
         board = new Board(3);

         turn = running = true;
      }

      public static void Main() {
         
         TicTacToe game = new TicTacToe();

         while (game.running) {

            char playing = game.turn ? 'X' : 'O';

            Console.WriteLine("\n" + playing + " TURN!\n");
            Console.WriteLine(game.board.toString());

            int x = -1;

            while (x < 0 || x > 3) {
               Console.Write("Enter x position: ");
               x = Convert.ToInt32(Console.ReadLine()) - 1;
            }

            int y = -1;

            while (y < 0 || y > 3) {
               Console.Write("Enter y position: ");
               y = Convert.ToInt32(Console.ReadLine()) - 1;
            }

            if (game.board.isValid(x,y)) {
               game.turn = !game.turn;

               game.board.makePlay(x,y,playing);
            
               if (game.board.isFull()) { 
                  game.running = false;
                  game.winner = "NONE";
               }

               if (game.board.checkWinner(playing)) {
                  game.running = false;
                  game.winner = playing.ToString();
               }
            }
         }

         Console.WriteLine("\n" + game.board.toString());

         Console.WriteLine("WINNER: " + game.winner);
         
      }

   }

}