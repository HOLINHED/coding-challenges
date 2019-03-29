#include "player.h"

Player::Player(int lev, int h, std::string n) {
  level = lev;
  health = h;
  name = n;
  printf("HALLO!!! [Constructor]\n");
}

void Player::damage(int amount) {
  health -= amount;
}

void Player::heal(int amount) {
  health += amount;
}

void Player::levelUp() {
  level += 1;
}

void Player::greet() {
  printf("Hi! I'm %s!\n", name.c_str());
}

void Player::stats() {
  printf("[%s] Level: %d | %d\n", name.c_str(), level, health);
}

Player::~Player() {
  printf("Bye bye! [Destructor]\n");
}