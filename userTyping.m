% Danny Lin
% Modified by Henry Sanger
function isCorrect = userTyping(word, gameScene, img, windowWidth, windowHeight)
    userInput = '';
    key = getKeyboardInput(gameScene);
    while ~strcmp(key, 'return')
        % Henry Sanger: Removed backspace check
        if length(key) == 1 && isstrprop(key, "alpha")
            userInput = [userInput char(key)];
        end
        img = drawWord(img, windowWidth, windowHeight, userInput, 0);
        drawScene(gameScene, img);
        % Henry Sanger: Added if statement to exit while loop if user input reaches length of word
        if length(userInput) == length(word)
            break;
        end
        key = getKeyboardInput(gameScene);
    end
    if strcmp(userInput, word)
        isCorrect = true;
    else 
        isCorrect = false;
    end
end