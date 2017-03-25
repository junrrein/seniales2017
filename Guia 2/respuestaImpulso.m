function salida = respuestaImpulso(A, B)

% Señal de entrada: delta Dirac
impulso = zeros(1, 20);
impulso(1) = 1;

% Señal escalon de ancho 5
%escalon = zeros(1, 20);
%escalon(1:5) = 1;

% Señal senoidal de ancho 20
%[~, senial] = senoidal(0, 1, 10, 1, 1, 0);
%senial = [senial zeros(1, 30)];

salida = sistemaLineal(A, B, impulso);
%salida = sistemaLineal(A, B, senial);