% Henry Sanger
function img = drawWord(img, windowWidth, windowHeight, chars)
    LETTER_INDICES = [980:992, 1012:1024]; % Locations of the letters in spritesheet
    CHAR_CODE_A = double('a'); % Character code of the letter a, used to calculate letter position
    numChars = length(chars);
    letterArray = zeros(1, numChars); % Preallocate array for performance
    for i = 1:numChars
        % Find the sprites corresponding to the index of each letter
        ch = double(chars(i));
        disp(chars(i))
        letterArray(i) = LETTER_INDICES(ch - CHAR_CODE_A + 1);
    end
    start = floor(windowWidth / 2 - numChars / 2) + 1; % Horizontally center the word
    img(windowHeight - 2, start:start + numChars - 1) = letterArray;
end
