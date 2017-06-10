function [B rCuadrado] = regresionLineal(x, y)
% Ver https://www.mathworks.com/help/matlab/data_analysis/linear-regression.html

X = [ones(length(x),1) x];
B = X \ y;

yRegresion = X * B;

if (sum((y - mean(y)).^2) < 1e-7)
    rCuadrado = 0;
else
    rCuadrado = 1 - sum((y - yRegresion).^2)/sum((y - mean(y)).^2);
end