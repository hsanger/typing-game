% Henry Sanger
function img = drawHealth(img, health)
    % Declare spritesheet indices for full and empty hearts
    FULL_HEART = 731;
    EMPTY_HEART = 729;

    % Draw the first row of hearts
    for i = 1:5
        if health >= i
            img(1, i) = FULL_HEART;
        else
            img(1, i) = EMPTY_HEART;
        end
    end

    % Draw the second row of hearts
    for i = 6:10
        if health >= i
            img(2, i - 5) = FULL_HEART;
        else
            img(2, i - 5) = EMPTY_HEART;
        end
    end
end