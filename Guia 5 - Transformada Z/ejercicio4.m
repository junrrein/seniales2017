clear

Xs = [12500 0];
Ys = [44 60625 6250000];
omega = linspace(0, 1300, 10000);

H = freqs(Xs, Ys, omega);
plot(abs(H))
