clear

[t, senoidal10] = senoidal(0, 1, 100, 10, 1, 0);
senoidal10Retardada = shift(senoidal10, 10);

FFT = fft(senoidal10);
N = length(FFT);

for k = 0 : N - 1
    FFT(k+1) *= exp(-j*2*pi*k*10 / N);
end

resultado = real(ifft(FFT));

if (all(resultado == senoidal10Retardada))
    disp("La propiedad de retardo temporal se cumple")
else
    disp("La propiedad de retardo temporal no se cumple")
end

subplot(3, 1, 1)
stem(t, senoidal10)
title("Señal original")
xlabel("Tiempo")
ylabel("Magnitud")

subplot(3, 1, 2)
stem(t, senoidal10Retardada)
title("Señal retardada 10 muestras a mano")
xlabel("Tiempo")
ylabel("Magnitud")

subplot(3, 1, 3)
stem(t, resultado)
title("Señal retardada 10 muestras mediante la propiedad de desplazamiento temporal en Fourier")
xlabel("Tiempo")
ylabel("Magnitud")


