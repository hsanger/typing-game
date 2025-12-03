clear;
clc;
close all;

WINDOW_WIDTH = 16;
WINDOW_HEIGHT = 12;
WORDS = readlines('words.txt');

% Declare indices of the sprites in the spritesheet
player = 26;
platform = 555;
incompletePlatform = 487;
number0 = 948;
number2 = 950;
number7 = 955;

% Create the scene
scene = simpleGameEngine("retro_pack.png", 16, 16, 5, [0, 0, 0]);

% Initialize the image
img = ones(WINDOW_HEIGHT, WINDOW_WIDTH);
img = drawWord(img, WINDOW_WIDTH, WINDOW_HEIGHT, char(getRandomWord(WORDS)));
img = drawHealth(img, 7);
drawScene(scene, img);
text(1000, 50, "Score", "FontSize", 20);

% Wait for any keyboard input to advance to the next scene
getKeyboardInput(scene);

% Clear the figure
clf;
