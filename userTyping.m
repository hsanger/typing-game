% Danny Lin
function isCorrect = userTyping(word, gameScene, img, windowWidth, windowHeight) %figure out a way to not count things like []\;,. without hardcoding a bunch of conditoinal
     userInput = '';
     key = getKeyboardInput(gameScene);
        while ~strcmp(key,'return')
        if strcmp(key, 'backspace')
            if ~isempty(userInput)
                userInput = userInput(1:end-1);
            end
        elseif length(key) == 1 && isstrprop(key, "alpha")
            userInput = [userInput char(key)];
        else            
        end
        img = drawWord(img, windowWidth, windowHeight, userInput);
        drawScene(gameScene, img);
        key = getKeyboardInput(gameScene);
        end 
        if strcmp(userInput, word)
            isCorrect = true;
        else 
            isCorrect = false;
        end
end