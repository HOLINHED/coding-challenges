#include <iostream>
#include <string>
#include "player.h"

class Person {

   private:

   std::string name;
   int age;

   public:

   Person(const std::string name, const int age) {
      this->name = name;
      this->age = age;
   }

   void greet() {
      printf("Hi! I'm %s\n", name.c_str());
   }

   ~Person() {
      printf("%s has stopped existing!\n", name.c_str());
   }

};

int main(void) {

   Person dawid("Dawid", 18);

   dawid.greet();

   printf("------------------\n");

   Player p(109,10,"Jack");

   p.stats();
   p.greet();

   return 0;
}