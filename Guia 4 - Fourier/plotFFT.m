function plotFFT (senial, fm)

N = length(senial);
espectroMagnitud = abs(fft(senial));


if mod(N, 2) == 0
  dominioFrecuencial = -N/2 + 1 : N/2;
  espectroMagnitud = shift(espectroMagnitud, N/2 - 1);
else
  dominioFrecuencial = -(N-1)/2 : (N-1)/2;
  espectroMagnitud = shift(espectroMagnitud, (N-1)/2);
end

dominioFrecuencial *= fm/N;
espectroMagnitud /= N;

stem(dominioFrecuencial, espectroMagnitud)
xlabel("Frecuencia (Hz) ")
ylabel("|X[k]|")
xlim([dominioFrecuencial(1) dominioFrecuencial(end)])
grid on
