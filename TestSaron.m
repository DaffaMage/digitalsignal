[a,fs] = audioread('SARON1SL.wav');
b = audioread('SARON2SL.wav');
c = audioread('SARON3SL.wav');
d = audioread('SARON5SL.wav');
e = audioread('SARON6SL.wav');
%cara komparasi panjang dan zero padding
x = length(a)
y = length(b)
if x~=y
    selisih = abs(y-x)
    ze = zeros(selisih,1);
    f =[b;ze];
    b = f;
    length(f) %for checking if b=a after zero padding
end
sp = zeros(1000,1); %zero distance
%bagian musik
g = [d;c;sp;d;c;sp;d;c;sp;e;d]; %mix time
g = [g;sp;e;d;sp;e;d;sp;e;d;sp;c;b];
g = [g;sp;c;b;sp;c;b;sp;c;b;sp;a;e];
g = [g;sp;a;e;sp;a;e;sp;a;e;sp;d;c];
plot(g) %bikin plot
soundsc(g,fs) %bunyikan lagu tralalala

%catatan : max length di a (saron1) dengan nilai 298701