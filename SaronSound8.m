%matlab 2017
sout = input('sound order (number : 1-6 except 4) : '); %this is the order of the sound
beat = 40000; %beat value
sout = reshape(sout,1,[]); %reshape multiple lines into 1 line
%read the audio files
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
%for additional safety, cover 4 in zeros
for i = 1:6
    checklen = length(s{i});
    if checklen<max && i~=4
        difference = max-checklen;
        zeropad = zeros(difference,1);
        temp = [s{i};zeropad];
        s{i} = temp;
    elseif i==4
        s{i} = zeros(max,1);
    end
    sd{i} = s{i}; %this variable is used for the output contruction
    %using s{i} will bug the output when a number is used repetitively
end
%constructing sound output
snd = zeros(max,1);
for j = 1:length(sout)
    snd = snd+sd{sout(j)};
    zeropad = zeros(beat,1);
    snd = [snd;zeropad];
    for i = 1:6
        sd{i} = [zeropad;sd{i}];
    end
end
plot(snd) %plot the sound
soundsc(snd,fs) %play the sound
audiowrite('output.wav',snd,fs); %write an output file