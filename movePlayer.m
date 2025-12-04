% Henry Sanger
function [img, playerX, playerY] = movePlayer(scene, img, playerX, playerY, playerAnimFrame)
    PLAYER = 307;
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
    newPosContents = img(playerY, playerX);
    if newPosContents == 1 % is blank
        img(oldPlayerY, oldPlayerX) = 1;
        img(playerY, playerX) = Sprites.PlayerAnim(playerAnimFrame);
        playerAnimFrame = mod(playerAnimFrame + 1, length(Sprites.PlayerAnim)) + 1
    else
        playerX = oldPlayerX;
        playerY = oldPlayerY;

        % If player tries to walk into a monster, trigger an encounter
        % If the tile isn't blank or a wall, it must be a monster!
        if newPosContents ~= Sprites.Wall

        end
    end

    % Update the scene
    drawScene(scene, img);
    movePlayer(scene, img, playerX, playerY, playerAnimFrame);
end
