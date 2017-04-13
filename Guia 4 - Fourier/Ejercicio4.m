senial1 = [hanning(15)' zeros(1, 105)];
senial2 = [hanning(30)' zeros(1, 90)];
senial3 = [hanning(60)' zeros(1, 60)];
senial4 = [hanning(90)' zeros(1, 30)];
senial1 /= norm(senial1);
senial2 /= norm(senial2);
senial3 /= norm(senial3);
senial4 /= norm(senial4);
fm = 120;

subplot(2, 4, 1)
stem(senial1)
title("Señal 1")
xlabel("Tiempo")
ylabel("Magnitud")
ylim([0 0.5])
subplot(2, 4, 5)
plotFFT(senial1, fm)
title("Transformada de Fourier de Señal 1")
ylim([0 0.07])

subplot(2, 4, 2)
stem(senial2)
title("Señal 2")
xlabel("Tiempo")
ylabel("Magnitud")
ylim([0 0.5])
subplot(2, 4, 6)
plotFFT(senial2, fm)
title("Transformada de Fourier de Señal 2")
ylim([0 0.07])

subplot(2, 4, 3)
stem(senial3)
title("Señal 3")
xlabel("Tiempo")
ylabel("Magnitud")
ylim([0 0.5])
subplot(2, 4, 7)
plotFFT(senial3, fm)
title("Transformada de Fourier de Señal 3")
ylim([0 0.07])

subplot(2, 4, 4)
stem(senial4)
title("Señal 4")
xlabel("Tiempo")
ylabel("Magnitud")
ylim([0 0.5])
subplot(2, 4, 8)
plotFFT(senial4, fm)
title("Transformada de Fourier de Señal 3")
ylim([0 0.07])


