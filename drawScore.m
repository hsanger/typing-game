% Henry Sanger
function img = drawScore(img, score)
    CHAR_CODE_0 = double('0');
    scoreChar = num2str(score);
    len = length(scoreChar)
    scoreDisplay = zeros(1, len); % Preallocate array
    for i = 1:len
        num = double(scoreChar(i));
        scoreDisplay(i) = Sprites.Numbers(num - CHAR_CODE_0 + 1);
    end
    img(1, end-len+1:end) = scoreDisplay;
end