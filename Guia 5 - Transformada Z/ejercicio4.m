clear

Xs = [12500 0];
Ys = [44 60625 6250000];

H = freqs(Xs, Ys, linspace(0,16*pi,10000));

stem(abs(H))
