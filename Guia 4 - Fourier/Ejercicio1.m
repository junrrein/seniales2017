clear
fm = 1000;

[~, senoidal10] = senoidal(0,1,fm,10,1,0);
[t, senoidal20] = senoidal(0,1,fm,20,4,0);

senial = senoidal10 + senoidal20;

subplot(2,1,1)
stem(t, senial)
title("y = sin(2*pi*f_1*t) + sin(2*pi*f_2*t), f_1 = 10 Hz, f_2 = 20 Hz")
xlabel("Tiempo")
ylabel("Magnitud")

subplot(2,1,2)
plotFFT(senial,fm)
title("Espectro de magnitud de la señal")
xlim([-25 25])

setFontSize(12)


% item 2 - Relacion de Parseval

sumatoria1 = sum(senial .^2);
sumatoria2 = sum(abs(fft(senial)).^2) / length(senial) ;

% Modificacion 1
input("")

senial += 4;

subplot(2,1,1)
stem(t, senial)
title("y = sin(2*pi*f_1*t) + sin(2*pi*f_2*t) + 4, f_1 = 10 Hz, f_2 = 20 Hz")
xlabel("Tiempo")
ylabel("Magnitud")

subplot(2,1,2)
plotFFT(senial,fm)
title("Espectro de magnitud de la señal")
xlim([-25 25])

setFontSize(12)

% Modificacion 2
input("")

[~, senoidal11] = senoidal(0,1,fm,11,4,0);
senial = senoidal10 + senoidal11;

subplot(2,1,1)
stem(t, senial)
title("y = sin(2*pi*f_1*t) + sin(2*pi*f_2*t), f_1 = 10 Hz, f_2 = 11 Hz")
xlabel("Tiempo")
ylabel("Magnitud")

subplot(2,1,2)
plotFFT(senial,fm)
title("Espectro de magnitud de la señal")
xlim([-15 15])

setFontSize(12)

% Modificacion 3
input("")

[~, senoidal10coma5] = senoidal(0,1,fm,10.5,4,0);
senial = senoidal10 + senoidal10coma5;

subplot(2,1,1)
stem(t, senial)
title("y = sin(2*pi*f_1*t) + sin(2*pi*f_2*t), f_1 = 10 Hz, f_2 = 10,5 Hz")
xlabel("Tiempo")
ylabel("Magnitud")

subplot(2,1,2)
plotFFT(senial,fm)
title("Espectro de magnitud de la señal")
xlim([-15 15])


setFontSize(12)

% Modificacion 4
input("")

[t, senoidal10coma5] = senoidal(0,2,fm,10.5,4,0);
senial = [senoidal10 senoidal10] + senoidal10coma5;

subplot(2,1,1)
stem(t, senial)
title("y = sin(2*pi*f_1*t) + sin(2*pi*f_2*t), f_1 = 10 Hz, f_2 = 10,5 Hz \nSeñal muestreada durante 2 segundos")
xlabel("Tiempo")
ylabel("Magnitud")

subplot(2,1,2)
plotFFT(senial,fm)
title("Espectro de magnitud de la señal")
xlim([-15 15])

setFontSize(12)
