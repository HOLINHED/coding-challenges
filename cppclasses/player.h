#include <string>
#include <stdio.h>

class Player {

   private:

   int level;
   int health;
   std::string name;

   public:

   Player(int level, int health, std::string name);

   void damage(int amount);

   void heal(int amount);

   void levelUp();

   void greet();

   void stats();

   ~Player();

};