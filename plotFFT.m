function plotFFT (senial, fm)

deltaF = fm / length(senial);
plot(getFFTBounds(senial) * deltaF, fftshift(abs(fft(senial))));
xlabel("Frecuencia (Hz)")
ylabel("Magnitud")
grid on

