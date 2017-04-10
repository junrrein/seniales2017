function plotFFT (senial, fm)

N = length(senial);
espectroMagnitud = abs(fft(senial));

dominioFrecuencial = -N/2 + 1 : N/2;
dominioFrecuencial *= fm/N; 

espectroMagnitud = shift(espectroMagnitud, N/2 - 1);
espectroMagnitud /= N;

stem(dominioFrecuencial, espectroMagnitud)
xlabel("frecuencia (Hz) ")
ylabel("|X[k]|")
grid on
