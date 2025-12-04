% Henry Sanger
function sound = loadSound(filename)
    [y, Fs] = audioread(filename);
    sound = audioplayer(y, Fs);
    sound.TimerPeriod = 0.01;
    sound.TimerFcn = @(~,~) disp('tick');   % lightweight callback
end