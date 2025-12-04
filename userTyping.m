% Danny Lin
function isCorrect = userTyping(word, gameScene, img, windowWidth, windowHeight) %figure out a way to not count things like []\;,. without hardcoding a bunch of conditoinal
     %initialize value
     userInput = ''; 
     %get input
     key = getKeyboardInput(gameScene); 
     %compare and end the input when the user presses enter
     while ~strcmp(key,'return') 
        if strcmp(key, 'backspace')
            if ~isempty(userInput) %check for empty case
                %cut off end of the matrix
                userInput = userInput(1:end-1);
            end
        %Check if the key is a character and ignore cases like comma or period.
        elseif length(key) == 1 && isstrprop(key, "alpha") 
            %add on to the matrix
            userInput = [userInput char(key)];
        else            
        end
        %draw the word
        img = drawWord(img, windowWidth, windowHeight, userInput, 1);
        drawScene(gameScene, img);
        key = getKeyboardInput(gameScene);
     end 
     %returns if the input matches the word
        if strcmp(userInput, word)
            isCorrect = true;
        else 
            isCorrect = false;
        end
end