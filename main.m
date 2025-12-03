clear;
clc;
close all;

WINDOW_WIDTH = 16;
WINDOW_HEIGHT = 12;

% Declare indices of the sprites in the spritesheet
fullHeart = 731;
emptyHeart = 729;
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
img = drawWord(img, WINDOW_WIDTH, WINDOW_HEIGHT, 'testing');
drawScene(scene, img);
text(1000, 50, "Score", "FontSize", 20);

% Wait for any keyboard input to advance to the next scene
getKeyboardInput(scene);

% Clear the figure
clf;
