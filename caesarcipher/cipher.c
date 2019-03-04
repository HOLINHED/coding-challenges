#include <stdio.h>
#include <string.h>

/**
 * Implement a Caesar cipher, both encoding and decoding. The key is an integer from 1 to 25. 
 * This cipher rotates the letters of the alphabet (A to Z). The encoding replaces each letter
 * with the 1st to 25th next letter in the alphabet (wrapping Z to A). So key 2 encrypts "HI" to "JK", but
 * key 20 encrypts "HI" to "BC".
 */

char* encrypt(char string[], int key) {
   
   for (int i = 0; i < strlen(string); i++) {

      if (string[i] != ' ' && ((string[i] >= 97 && string[i] <= 122) 
         || (string[i] >= 65 && string[i] <= 90))) {

         int newChar = string[i] + key;

         int max = 0;
         int min = 0;

         if (string[i] >= 97 && string[i] <= 122) {
            max = 122;
            min = 97;
         } else {
            max = 90;
            min = 65;
         }

         if (newChar > max)
            newChar = min + (newChar - max);

         string[i] = newChar;

      }
   }

   return string;
   
}

char* decrypt(char string[], int key) {
   
   for (int i = 0; i < strlen(string); i++) {

      if (string[i] != ' ' && ((string[i] >= 97 && string[i] <= 122) 
         || (string[i] >= 65 && string[i] <= 90))) {

         int newChar = string[i] - key;

         int max = 0;
         int min = 0;

         if (string[i] >= 97 && string[i] <= 122) {
            max = 122;
            min = 97;
         } else {
            max = 90;
            min = 65;
         }

         if (newChar < min)
            newChar = max - (min - newChar);

         string[i] = newChar;

      }
   }

   return string;
   
}

int main() {

   char string[] = "HeLlO WoRlD!!";

   printf("ENCRYPTED: %s\n", encrypt(string, 5));

   char encrypted[] = "MjQqT CtWqI!!";

   printf("DECRYPTED: %s\n", decrypt(encrypted, 5));

   return 0;
}