% Danny Lin
% Modified by Henry Sanger
function isCorrect = userTyping(word, gameScene, img, windowWidth, windowHeight)
    %initialize value
    userInput = '';
    %get input
    key = getKeyboardInput(gameScene);
    %compare and end the input when the user presses enter
    while ~strcmp(key, 'return')
        % Henry Sanger: Removed backspace check
        if length(key) == 1 && isstrprop(key, "alpha") %Check if the key is a character and ignore cases like comma or period.
            %add on to the matrix
            userInput = [userInput char(key)];
        end
        %draw the word
        img = drawWord(img, windowWidth, windowHeight, userInput, 0);
        drawScene(gameScene, img);
        % Henry Sanger: Added if statement to exit while loop if user input reaches length of word
        if length(userInput) == length(word)
            break;
        end
        key = getKeyboardInput(gameScene);
     end
     %returns if the input matches the word
    if strcmp(userInput, word)
        isCorrect = true;
    else 
        isCorrect = false;
    end
end