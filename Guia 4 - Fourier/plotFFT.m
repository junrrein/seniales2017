function plotFFT (senial, fm)

N = length(senial);
espectroMagnitud = abs(fft(senial));

dominioFrecuencial = -N/2 + 1 : N/2;
dominioFrecuencial *= fm/N; 

espectroMagnitud = shift(espectroMagnitud, N/2 - 1);
espectroMagnitud /= N;

stem(dominioFrecuencial, espectroMagnitud)
xlabel("Frecuencia (Hz) ")
ylabel("|X[k]|")
xlim([dominioFrecuencial(1) dominioFrecuencial(end)])
grid on
