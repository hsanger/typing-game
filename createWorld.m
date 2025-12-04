% Henry Sanger
function world = createWorld(worldData)
    [height, width] = size(worldData);
    world = zeros(height, width); % Preallocate array for performance
    % Iterate over each coordinate of the world, converting letters to
    % sprite indices
    for x = 1:width
        for y = 1:height
            ch = worldData(y, x);
            if ch == 'w'
                world(y, x) = Sprites.Wall;
            elseif ch == 'm'
                world(y, x) = Sprites.Monsters(randi(length(Sprites.Monsters))); % Random monster
            elseif ch == 'f'
                world(y, x) = Sprites.Finish;
            else
                world(y, x) = 1; % Blank space
            end
        end
    end
end