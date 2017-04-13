senial = load("PDS2016_GTP04/necg.txt")';
fm = 360;
tFinal = length(senial) / fm;
t = 0 : 1/fm : (tFinal - 1/fm);

subplot(2, 2, 1)
stem(t, senial)
title("EKG de un paciente")
xlabel("Tiempo")
ylabel("Magnitud")

subplot(2, 2, 3)
plotFFT(senial, fm)
title("Espectro de Fourier de la señal")

senialFFT = fftshift(fft(senial));

N = length(senial);
dominioFrecuencial = -N/2 + 1 : N/2;
dominioFrecuencial *= fm/N;

indices = abs(dominioFrecuencial) > 40;
senialFFT(indices) = 0;
senialFFT = ifftshift(senialFFT);

senialFiltrada = ifft(senialFFT);

subplot(2, 2, 2)
stem(dominioFrecuencial, abs(fftshift(senialFFT)))
title("Espectro de magnitud de la señal filtrada")
xlabel("Frecuencia (Hz)")
ylabel("|X(f)|")
xlim([dominioFrecuencial(1) dominioFrecuencial(end)])

subplot(2, 2, 4)
stem(t, senialFiltrada)
title("Señal filtrada")
xlabel("Tiempo")
ylabel("Magnitud")

setFontSize(12)
