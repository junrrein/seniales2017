% Generamos la señal discreta mestreada a 10 Hz
tInicial = 0;
tFinal = 1;
fm = 10;
T = 1/fm;
[tOriginal, yOriginal] = senoidal(tInicial, tFinal, fm, 2, 1, 0);

[tInterpoladoEscalon, yInterpoladoEscalon] = interpolar(tOriginal, yOriginal, @interpolanteEscalon, 4);
[tInterpoladoLineal, yInterpoladoLineal] = interpolar(tOriginal, yOriginal, @interpolanteLineal, 4);
[tInterpoladoSinc, yInterpoladoSinc] = interpolar(tOriginal, yOriginal, @sinc, 4);

figure(1)
subplot(2, 1, 1)
stem(tOriginal, yOriginal)
title("Senial original")
xlabel("Tiempo (segundos")
ylabel("Magnitud")

subplot(2, 1, 2)
stem(tInterpoladoEscalon, yInterpoladoEscalon)
title("Senial interpolada mediante funcion escalon")
xlabel("Tiempo (segundos")
ylabel("Magnitud")

figure(2)
subplot(2, 1, 1)
stem(tOriginal, yOriginal)
title("Senial original")
xlabel("Tiempo (segundos")
ylabel("Magnitud")

subplot(2, 1, 2)
stem(tInterpoladoLineal, yInterpoladoLineal)
title("Senial interpolada mediante funcion lineal")
xlabel("Tiempo (segundos")
ylabel("Magnitud")

figure(3)
subplot(2, 1, 1)
stem(tOriginal, yOriginal)
title("Senial original")
xlabel("Tiempo (segundos")
ylabel("Magnitud")

subplot(2, 1, 2)
stem(tInterpoladoSinc, yInterpoladoSinc)
title("Senial interpolada mediante funcion sinc")
xlabel("Tiempo (segundos")
ylabel("Magnitud")
