% Henry Sanger
clear;
clc;

WINDOW_WIDTH = 20;
WINDOW_HEIGHT = 19;

% Load sounds
step = loadSound('step.mp3');
monsterEncounter = loadSound('monster-encounter.mp3');
monsterDeath = loadSound('monster-death.mp3');
damage = loadSound('damage.mp3');
win = loadSound('win.mp3');
lose = loadSound('lose.mp3');

% Load a list of random words from a file
words = readlines('words.txt');

% Load the maze layout from a file
worldData = char(readlines('world.txt'));
world = createWorld(worldData);

% Create the scene
scene = simpleGameEngine("retro_pack.png", 16, 16, 1, [0, 0, 0]);

% Danny Lin
isPlaying = true;
while isPlaying

    % Henry Sanger

    close all;

    % Initialize the image
    img = ones(WINDOW_HEIGHT, WINDOW_WIDTH);
    img(3:end-2, :) = world;
    
    % Set up the player
    playerX = 2;
    playerY = 4;
    playerAnimFrame = 1;
    img(playerY, playerX) = Sprites.PlayerAnim(playerAnimFrame);

    % Danny Lin
    health = 10;
    score = 0;

    % Henry Sanger
    img = drawHealth(img, health);
    img = drawScore(img, score);

    drawScene(scene, img);

    % Danny Lin
    while health > 0
        % Main game loop by Henry Sanger

        % Get an arrow key input
        key = 'a';
        while ~endsWith(key, 'arrow')
            key = getKeyboardInput(scene);
        end
    
        % Save the player's current coordinates
        oldPlayerX = playerX;
        oldPlayerY = playerY;
    
        % Move the player
        switch key
            case 'uparrow'
                playerY = playerY - 1;
            case 'downarrow'
                playerY = playerY + 1;
            case 'leftarrow'
                playerX = playerX - 1;
            case 'rightarrow'
                playerX = playerX + 1;
        end
    
        % If the player's new position is valid, update their position in the
        % scene; otherwise, reset their position to the previous one
        newTile = img(playerY, playerX);
        if newTile == 1 % is blank
            % Play step sound
            play(step);
            img(oldPlayerY, oldPlayerX) = 1;
            img(playerY, playerX) = Sprites.PlayerAnim(playerAnimFrame);
            % Advance to the next animation frame, using mod to wrap around to the beginning when the end is reached
            playerAnimFrame = mod(playerAnimFrame + 1, length(Sprites.PlayerAnim)) + 1;
        else
            % If player walks onto finish tile, show winning sequence
            if newTile == Sprites.Finish
                img = drawWord(img, WINDOW_WIDTH, WINDOW_HEIGHT, 'youwin', 1);
                img = drawWord(img, WINDOW_WIDTH, WINDOW_HEIGHT, 'youwin', 0);
                drawScene(scene, img);
                play(win);
                break;
            % If player tries to walk into a monster, trigger an encounter
            % If the tile isn't blank, a wall, or the finish, it must be a monster!
            elseif newTile ~= Sprites.Wall
                % Play encounter sound effect
                play(monsterEncounter);

                % Get a random word
                randomWord = char(getRandomWord(words));

                % Draw it to the screen
                img = drawWord(img, WINDOW_WIDTH, WINDOW_HEIGHT, randomWord, 1);
                drawScene(scene, img);

                % Wait for the user to type the word and check if they got it right
                wordIsCorrect = userTyping(randomWord, scene, img, WINDOW_WIDTH, WINDOW_HEIGHT);
                if wordIsCorrect
                    img(playerY, playerX) = 1; % The monster is vanquished!
                    score = score + 1;
                    img = drawScore(img, score);
                    play(monsterDeath);
                else 
                    health = health - 1;
                    img = drawHealth(img, health);
                    play(damage);
                end

                % Wait a second then clear words
                pause(1);
                img(end-1:end, :) = ones(2, WINDOW_WIDTH);
            end

            % Reset the player's position
            playerX = oldPlayerX;
            playerY = oldPlayerY;
        end
    
        % Update the scene
        drawScene(scene, img);
    end

    % If health is 0, player lost, so change player sprite to dead and
    % play death sound effect (Henry Sanger)
    if health <= 0
        img(playerY, playerX) = Sprites.PlayerDead;
        img = drawWord(img, WINDOW_WIDTH, WINDOW_HEIGHT, 'youlose', 1);
        img = drawWord(img, WINDOW_WIDTH, WINDOW_HEIGHT, 'youlose', 0);
        drawScene(scene, img);
        play(lose);
    end

    % Prompt the user to play again (Danny Lin)
    text(15, 100, "Would you like to play again? (Y for yes / N for no)", "FontSize", 20, Color=[1 1 1], BackgroundColor=[0 0 0]);
    uInput = getKeyboardInput(scene);  
    if strcmp(uInput, 'n')
       isPlaying = false;
    end
end
