#include <iostream>

int main(void) {

   struct Person {
      std::string name;
      int age;
   };

   struct Person dawid = { "Dawid", 18 };

   printf("Name: %s   Age: %d\n", dawid.name.c_str(), dawid.age);

   Person john = { "John", 19 };

   printf("Name: %s   Age: %d\n", john.name.c_str(), john.age);

   struct BankAccount {
      std::string owner;
      int balance;
   } account1;

   account1.owner   = "Dawid";
   account1.balance = 21;

   printf("Owner: %s   Balance: %d\n", account1.owner.c_str(), account1.balance);

   // allocating memory for pointer
   struct Person* terry = (Person*) malloc(sizeof(Person));

   terry->name = "Terry";
   terry->age = 20;

   printf("Name: %s   Age: %d\n", terry->name.c_str(), terry->age);

   struct Person* dawid2 = &dawid;

   printf("Name: %s   Age: %d\n", dawid2->name.c_str(), dawid2->age);

   free(terry);

   return 0;
}