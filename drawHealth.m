% Henry Sanger
function img = drawHealth(img, health)
    FULL_HEART = 731;
    EMPTY_HEART = 729;
    for i = 1:5
        if health >= i
            img(1, i) = FULL_HEART;
        else
            img(1, i) = EMPTY_HEART;
        end
    end
    for i = 6:10
        if health >= i
            img(2, i - 5) = FULL_HEART;
        else
            img(2, i - 5) = EMPTY_HEART;
        end
    end
end