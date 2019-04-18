#include <iostream>

int main(void) {

   const int MIN = 1;
   const int MAX = 10;

   srand(time(NULL));

   const int num = rand() % MAX + MIN;

   std::cout << "Random number: " << num << std::endl;

   puts("Cool");

   return 0;
}