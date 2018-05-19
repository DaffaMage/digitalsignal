[a,fs] = audioread('SARON1SL.wav');
b = audioread('SARON5SL.wav');
c = audioread('SARON6SL.wav');
a = a(1:40000);
b = b(1:40000);
c = c(1:40000);

%blind + ref signal --> output

reff = a;
blind = [zeros(1000,1);a];
blind = blind(1:40000);
x = xcorr(reff,blind);
figure(6);
plot(x);
[m,n] = max(x)

%kesimpulan 1 : sinyal reff ada di blind maka A tinggi
%kesimpulan 2 : sinyal reff tidak ada di blind maka A rendah
%nitpick : sinyal blind digeser lebih dari 34200, nilai n != length-total
%zeropad

%jenis sinyal : monofonik dan polyfonik

%suara sintetik : sinyal sinus
frq = 480; %contoh frekuensi
a = sin(2*pi*frq/fs*(1:100000)); %sinyal a baru
envelope = a.*(0.7693*exp(-1.709*10.^-5)); %nilai envelope (riset Pak Yoyon)
%rumus envelope perlu di cek lebih lanjut
sound(a,48000);

%frekuensi sama, warna suara beda, membuat diferensiasi