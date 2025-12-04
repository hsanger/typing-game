% Henry Sanger
function img = drawHealth(img, health)
    % Draw the first row of hearts
    for i = 1:5
        if health >= i
            img(1, i) = Sprites.FullHeart;
        else
            img(1, i) = Sprites.EmptyHeart;
        end
    end

    % Draw the second row of hearts
    for i = 6:10
        if health >= i
            img(2, i - 5) = Sprites.FullHeart;
        else
            img(2, i - 5) = Sprites.EmptyHeart;
        end
    end
end