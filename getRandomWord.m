function word = getRandomWord()
    wordPossibilities = [];
    index = randi(length(wordPossibilities));
    word = wordPossibilities(index);
end
