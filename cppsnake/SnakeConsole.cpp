#include <iostream>
#include <Windows.h>
#include <time.h>
#include <thread>
#include <chrono>
#include <vector>

const int screenWidth  = 120;
const int screenHeight = 40;

int main() {
	wchar_t* screen = new wchar_t[screenWidth * screenHeight];
	HANDLE console = CreateConsoleScreenBuffer(GENERIC_READ | GENERIC_WRITE, 0, NULL, CONSOLE_TEXTMODE_BUFFER, NULL);
	SetConsoleActiveScreenBuffer(console);
	DWORD dwBytesWritten = 0;

	srand(time(NULL));

	struct Player {
		int x  = screenWidth / 2;
		int y  = screenHeight / 2;
		int vx = 0;
		int vy = 0;
		int l  = 0;
	} player;

	struct Pos {
		int x;
		int y;
	};

	struct Pos fruit = { 6, 10 };

	// tail
	std::vector<Pos> tail;

	unsigned int score = 0;

	// main game loop
	while (true) {

		// ----- timing -----
		// different timings for constant speed.
		std::this_thread::sleep_for(std::chrono::milliseconds(player.vx == 0 ? 100 : 60));

		// ----- input -----
		if (GetAsyncKeyState(VK_LEFT)) {
			player.vx = -1;
			player.vy = 0;
		}
		if (GetAsyncKeyState(VK_RIGHT)) {
			player.vx = 1;
			player.vy = 0;
		}
		if (GetAsyncKeyState(VK_UP)) {
			player.vx = 0;
			player.vy = -1;
		}
		if (GetAsyncKeyState(VK_DOWN)) {
			player.vx = 0;
			player.vy = 1;
		}

		// ----- game logic -----
		player.x += player.vx;
		player.y += player.vy;

		// die if off screen
		if (player.x <= 0 || player.x >= screenWidth - 1 || player.y <= 0 || player.y >= screenHeight - 1) {
			tail.clear();
			player.l = 0;
			player.x = screenWidth / 2;
			player.y = screenHeight /2;
		}

		// player collides with fruit
		if (player.x == fruit.x && player.y == fruit.y) {
			fruit.x = rand() % (screenWidth - 2) + 1;
			fruit.y = rand() % (screenHeight - 2) + 1;
			player.l += 5;
			score += 100;
		}

		// player collides with tail
		for (auto& part : tail) {
			if (part.x == player.x && part.y == player.y) {
				tail.clear();
				player.l = 0;
				break;
			}
		}

		// adds new tail state
		tail.push_back({ player.x, player.y });

		// deletes old tail states
		if (tail.size() > player.l) {
			tail.erase(tail.begin());
		}

		// ----- draw ------
		// draw walls
		for (int y = 0; y < screenHeight; y++) {
			for (int x = 0; x < screenWidth; x++) {
				if (x == 0 || y == 0 || x == screenWidth - 1 || y == screenHeight - 1) {
					screen[y * screenWidth + x] = L'\u2593';
				} else {
					screen[y * screenWidth + x] = L' ';
				}
			}
		}

		// print score
		wsprintf(&screen[2 * screenWidth + 3], L"Score: %d", score);

		//draw tail
		for (auto& part : tail) {
			screen[part.y * screenWidth + part.x] = L'T';
		}

		// draw player and fruit
		screen[player.y * screenWidth + player.x] = L'P';
		screen[fruit.y * screenWidth + fruit.x]   = L'F';

		// draw frame
		screen[screenWidth * screenHeight - 1] = L'\0';
		WriteConsoleOutputCharacter(console, screen, screenWidth * screenHeight, { 0,0 }, &dwBytesWritten);
	}

	delete[](screen);

	return 0;
}

