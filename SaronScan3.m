s{1} = audioread('SARON1SL.wav');
s{2} = audioread('SARON2SL.wav');
s{3} = audioread('SARON3SL.wav');
s{5} = audioread('SARON5SL.wav');
s{6} = audioread('SARON6SL.wav');
fs = input('fs : ');
%iterasi data
for i=1:6
    if i~=4
        if length(s{i})<fs
           zeropad = fs-length(s{i});
           s{i} = [s{i};zeros(zeropad,1)];
        end
        b = fft(s{i}(1:fs));
        g = abs(b);
        figure(i);
        plot(g);
        e = (g(1:2000)); %maximal 
        plot(e);
        [m,n] = max(e); %n adalah hertz puncak
        peak(i,2)=n;
        peak(i,1)=i;
    end
end
%decimate data at 4, which is 0 0
peak( ~any(peak,2), : ) = [];  %rows
peak( :, ~any(peak,1) ) = [];  %columns
xlswrite('SaronScan.csv',peak,'A2:B6');