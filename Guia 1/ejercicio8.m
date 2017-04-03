[t, senial] = senoidal(0, 1, 400, 2, 1, 0);
ruido = rand(1, length(senial)) - 0.5;

energiaSenial = norm(senial) .^ 2;
energiaRuido = norm(ruido) .^ 2;

% SNR entre las señales originales
% Notar que acá estoy usando la energía de las señales en el cálculo,
% no la potencia. Esto es porque el divisor en el cálculo de la potencia
% es el mismo para ambas señales, y se cancela al hacer el cociente.
SNROriginal = 10 * log10(energiaSenial / energiaRuido)

alpha = sqrt(energiaSenial / energiaRuido);

ruidoCorregido = ruido * alpha;
energiaRuidoCorregido = norm(ruidoCorregido) .^ 2;

% SNR entre las señales con el ruido corregido
SNRNueva = 10 * log10(energiaSenial / energiaRuidoCorregido)

figure
subplot(2, 1, 1)
plot(t, senial + ruido)
title(cstrcat("Suma de las señales originales (senoidal + ruido uniforme). SNR = ", num2str(SNROriginal), " dB"))
xlabel("Tiempo")
ylabel("Magnitud")
grid on

subplot(2, 1, 2)
plot(t, senial + ruidoCorregido)
title(cstrcat("Suma de las señales con el ruido modificado. SNR = ", num2str(SNRNueva), " dB"))
xlabel("Tiempo")
ylabel("Magnitud")
grid on

setFontSize(12)
