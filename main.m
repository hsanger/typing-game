clear;
clc;
close all;

WINDOW_WIDTH = 20;
WINDOW_HEIGHT = 20;

words = readlines('words.txt');

worldData = char(readlines('world.txt'));
world = createWorld(worldData);

% Declare indices of the sprites in the spritesheet
number0 = 948;
number2 = 950;
number7 = 955;

% Create the scene
scene = simpleGameEngine("retro_pack.png", 16, 16, 5, [0, 0, 0]);

% Initialize the image
img = ones(WINDOW_HEIGHT, WINDOW_WIDTH);
img(3:end-3, :) = world;
img = drawWord(img, WINDOW_WIDTH, WINDOW_HEIGHT, char(getRandomWord(words)));
img = drawHealth(img, 7);
drawScene(scene, img);
[img, playerX, playerY] = movePlayer(scene, img, 2, 4, 1);
text(1000, 50, "Score", "FontSize", 20);
