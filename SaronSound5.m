sout = input('sound order : ');
[s{1},fs] = audioread('SARON1SL.wav');
s{2} = audioread('SARON2SL.wav');
s{3} = audioread('SARON3SL.wav');
s{5} = audioread('SARON5SL.wav');
s{6} = audioread('SARON6SL.wav');
%make the length equal for all files, this is for safety in case of mix
%this code below find the longest audio file
max = 0;
for i = 1:6
    curlen = length(s{i});
    if curlen>max
        max = curlen;
    end
end
%with assumption we don't know the longest file, we iterate to find the
%ones we need to pad with zeros
for i = 1:6
    checklen = length(s{i});
    if checklen<max && i~=4
        difference = max-checklen;
        zeropad = zeros(difference,1);
        temp = [s{i};zeropad];
        s{i} = temp;
    end
    %extra 1000 for distance
    if i~=4
        zeropad = zeros(1000,1);
        temp = [s{i};zeropad];
        s{i} = temp;
    end
end
%constructing sound output
snd = zeros(0,1); %initialize
snd = [snd;s{sout}]; %put the list of sound
snd = reshape(snd,[],1); %reform into 1 column
plot(snd)
soundsc(snd,fs)