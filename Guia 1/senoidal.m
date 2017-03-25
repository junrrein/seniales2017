function [t, y] = senoidal(tInicial, tFinal, fMuestreo, fSenoidal, amplitud, angFase)
% ENTRADA
% tInicial = tiempo inicial
% tFinal = tiempo final
% fMuestreo = frecuencia de muestreo
% fSenoidal = frecuencia de la señal
% amplitud = amplitud de la señall
% angFase = angulo de fase de la señall
% 
% Salida
% t = vector con valores de la variable independiente
% y = vector de con valores de la señal generada.

    T = 1 / fMuestreo;
    t = tInicial : T : (tFinal - T);
    y = amplitud * sin(2*pi * fSenoidal * t + angFase);

end