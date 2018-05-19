%MUHAMMAD DAFFA ABIYYU RAHMAN
%07211640000010
[a,fs] = audioread('SARON3SL.WAV');
wind = 8000;
hopsize = 500;
n = floor((length(a)-wind)/hopsize); %floor untuk menghapus koma
hsl = [];
for i=1:n
    b = fft(a((i*hopsize)-hopsize+1:(i*hopsize-hopsize)+wind));
    c = abs(b(1:wind));%b berisi dari 1-wind
    hsl = [hsl;c];
end
hsl2 = reshape(hsl,[],n);
figure(n);
mesh(hsl2);