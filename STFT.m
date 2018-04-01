[a,fs] = audioread('output.wav');
winlen = 10000;
x = floor(length(a)/winlen);
hsl = [];

for i=1:x
    b = a((i*winlen)-winlen+1:i*winlen);
    c = fft(b);
    d = abs(c(1:winlen));
    hsl = [hsl;d];
end
hsl2 = reshape(hsl,[],x);
figure(x);
mesh(hsl2);