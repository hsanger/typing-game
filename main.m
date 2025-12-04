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

isPlaying = true;

while isPlaying %loop for as long as the player is playing
health = 10;  %initialize values
score = 0;
    while health > 0
 
% Create the scene
scene = simpleGameEngine("retro_pack.png", 16, 16, 5, [0, 0, 0]);

% Initialize the image
img = ones(WINDOW_HEIGHT, WINDOW_WIDTH);

randomWord = char(getRandomWord(WORDS));
img = drawWord(img, WINDOW_WIDTH, WINDOW_HEIGHT, randomWord, 2);
img = drawHealth(img, health);
drawScene(scene, img);
text(1000, 50, "Score: " +score, "FontSize", 20, Color=[1 0 0]);

% Wait for any keyboard input to advance to the next scene
wordIsCorrect = userTyping(randomWord, scene, img, WINDOW_WIDTH, WINDOW_HEIGHT)
%Determine what to do after results
if wordIsCorrect
    score = score + 1;
else 
    health = health - 1;
end
    end
    %prompt and input for user if they want to restart
    text(35, 400, "Would you like to play again? (Y for yes / N for no)", "FontSize", 20, Color=[1 0 0]);
    uInput = getKeyboardInput(scene);  
    if strcmp(uInput, 'n')
       isPlaying = false;
    end
end


% Clear the figure
clf;
