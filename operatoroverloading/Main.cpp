#include <stdio.h>
#include <iostream>

class Player {

private:

   std::string _name;
   int _level;
   int _power;

public:

   Player(std::string name, int level, int power)
   : _name(name), _level(level), _power(power) {
      printf("Created!  Name: %s  level: %d  power:  %d\n", _name.c_str(), _level, _power);
   }

   Player operator + (Player const &player) {
      // Creates a new player with level/power of this + other player, combines name
      const std::string newName = _name + " " + player._name;
      const int newPower = _power + player._power;
      const int newLevel = _level + player._level;

      Player fusion = Player(newName, newLevel, newPower);

      return fusion;
   }

   ~Player() {
      printf("Destroyed: %s\n", _name.c_str());
   }

};

int main(void) {

   Player player1 = Player("Jack", 109, 4028);
   Player player2 = Player("Jerry", 89, 3986);

   Player fusion = player1 + player2;

   return 0;
}