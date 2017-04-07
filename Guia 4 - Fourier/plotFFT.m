function plotFFT (senial, fm)

N = length(senial);
espectroMagnitud = abs(fft(senial));

dominioFrecuencial = -fm/2 + 1 : fm/2;
dominioFrecuencial *= fm/N; 

espectroMagnitud = shift(espectroMagnitud, fm/2 - 1);
espectroMagnitud /= N;

stem(dominioFrecuencial, espectroMagnitud)
xlabel("frecuencia (Hz) ")
ylabel("|X[k]|")
grid on