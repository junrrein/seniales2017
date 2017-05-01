clear

% Sistema analógico

Xs = [12500 0];
Ys = [44 60625 6250000];
omega = linspace(0, 3000, 10001);

H = freqs(Xs, Ys, omega);
H = 20*log10(abs(H));
H -= max(H);

indice0dB_S = find(H == max(H));
for (i = indice0dB_S : length(H))
    if (H(i) >= -3 && H(i+1) < -3)
        indice3dB_S = i;
        break
    end
end

deltaF = 3000 / 10000;
deltaF_Hz_S = deltaF / (2*pi);
frecuenciaCorteS = indice3dB_S * deltaF_Hz_S;

fm = round(4 * frecuenciaCorteS) - 1;
T = 1/fm;

% Sistema digital - Euler

EulerX = [12500*T -12500*T];
EulerY = [(6250000*T^2 + 60625*T + 44) (-60625*T -88) 44];

H_Euler = freqz(EulerX, EulerY, fm/2);
H_Euler = 20*log10(abs(H_Euler));
H_Euler -= max(H_Euler);

indice0dB_Euler = find(H_Euler == max(H_Euler));
for (i = indice0dB_Euler : length(H_Euler))
    if (H_Euler(i) >= -3 && H_Euler(i+1) < -3)
        indice3dB_Euler = i;
        break
    end
end

frecuenciaCorteEuler = indice3dB_Euler; % El deltaF es 1

% Sistema digital - Bilineal

BilinealX = [12500*T -12500*T];
BilinealY = [(3125000*T^2 + 60625*T + 88) (6250000*T^2 - 176) (3125000*T^2 - 60625*T + 88)];

H_Bilineal = freqz(BilinealX, BilinealY, fm/2);
H_Bilineal = 20*log10(abs(H_Bilineal));
H_Bilineal -= max(H_Bilineal);

indice0dB_Bilineal = find(H_Bilineal == max(H_Bilineal));
for (i = indice0dB_Bilineal : length(H_Bilineal))
    if (H_Bilineal(i-1) > -3 && H_Bilineal(i) <= -3)
        indice3dB_Bilineal = i;
        break
    end
end

%plot(H_Bilineal)
%
%frecuenciaCorteBilineal = indice3dB_Bilineal; % El deltaF es 1

% Gráficos

subplot(3, 1, 1)
plot(omega / (2*pi), H)
hold on
plot([indice0dB_S*deltaF_Hz_S indice0dB_S*deltaF_Hz_S], [0 -30])
plot([frecuenciaCorteS frecuenciaCorteS], [0 -30])
xlim([0 600])
title("Respuesta en frecuencia del sistema analógico")
xlabel("Frecuencia (Hz)")
ylabel("|H(jw)|")
grid on

subplot(3, 1, 2)
plot(0:(fm/2) - 1, H_Euler)
hold on
plot([indice0dB_Euler indice0dB_Euler], [0 -30])
plot([frecuenciaCorteEuler frecuenciaCorteEuler], [0 -30])
xlim([0 600])
title("Respuesta en frecuencia del sistema digital (Euler)")
xlabel("Frecuencia (Hz)")
ylabel("|H(exp(jw)|")
grid on

%subplot(3, 1, 3)
%plot(0:(fm/2) - 1, H_Bilineal)
%hold on
%plot([indice0dB_Bilineal indice0dB_Bilineal], [0 -30])
%plot([frecuenciaCorteBilineal frecuenciaCorteBilineal], [0 -30])
%xlim([0 600])
%title("Respuesta en frecuencia del sistema digital (Bilineal)")
%xlabel("Frecuencia (Hz)")
%ylabel("|H(exp(jw)|")
%grid on

setFontSize(12)