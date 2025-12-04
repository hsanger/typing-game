% Henry Sanger
function world = createWorld(worldData)
    WALL = 17;
    GHOST = 219;
    MAGE = 89;
    TROLL = 90;
    BUGS = 185:191;
    ANIMALS = [283:285, 288];
    MONSTERS = [GHOST, MAGE, TROLL, BUGS, ANIMALS];
    FINISH = 780;
    [height, width] = size(worldData);
    world = zeros(height, width);
    for x = 1:width
        for y = 1:height
            ch = worldData(y, x);
            if ch == 'w'
                world(y, x) = WALL;
            elseif ch == 'm'
                world(y, x) = MONSTERS(randi(length(MONSTERS))); % Random monster
            elseif ch == 'f'
                world(y, x) = FINISH;
            else
                world(y, x) = 1;
            end
        end
    end
end