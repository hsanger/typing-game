% Function created by Henry Sanger
% verticalPos argument added by Danny Lin
function img = drawWord(img, windowWidth, windowHeight, chars, verticalPos)
    CHAR_CODE_A = double('a'); % Character code of the letter a, used to calculate letter position
    img(windowHeight - verticalPos, :) = 1; % Clears the row (added by Danny Lin)
    numChars = length(chars);
    letterArray = zeros(1, numChars); % Preallocate array for performance
    for i = 1:numChars
        % Find the sprites corresponding to the index of each letter
        ch = double(chars(i));
        letterArray(i) = Sprites.Letters(ch - CHAR_CODE_A + 1);
    end
    start = floor(windowWidth / 2 - numChars / 2) + 1; % Horizontally center the word
    img(windowHeight - verticalPos, start:start + numChars - 1) = letterArray;
end
