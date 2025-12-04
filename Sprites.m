% Henry Sanger
classdef Sprites
    properties (Constant)
        PlayerAnim = 307:311;

        % World
        Wall = 17;
        Ghost = 219;
        Mage = 89;
        Troll = 90;
        Bugs = 185:191;
        Animals = [283:285, 288];
        Monsters = [Sprites.Ghost, Sprites.Mage, Sprites.Troll, Sprites.Bugs, Sprites.Animals];
        Finish = 780;

        % UI
        FullHeart = 731;
        EmptyHeart = 729;
        Numbers = 948:956;
    end
end
