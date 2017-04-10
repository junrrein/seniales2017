function [tInterpolado, yInterpolado] = interpolar(tOriginal, yOriginal, fInterpolante, factorRemuestreo)

T = tOriginal(2) - tOriginal(1);
nuevoT = T / factorRemuestreo;

% Generar el nuevo vector de tiempo
tInterpolado = tOriginal(1) : nuevoT : (tOriginal(end) + (factorRemuestreo - 1) * nuevoT);
% Generar el nuevo vector de valores
yInterpolado = zeros(1, length(tInterpolado));

% para una muestra de la señal interpolada
for ii = 1 : length(tInterpolado);

% iterar sobre todas las muestras de la senial original

  % para cada muestra de la senial original
  for jj = 1 : length(tOriginal)
    % se multiplica esa muestra por la funcion interpolante evaluada
    
    % Se reduce la precision del resultado de la division porque, cuando
    % se dividen dos numeros practicamente iguales, puede que el resultado de
    % menor a 1 por cosas raras de los numeros flotantes.
    % Reduciendo la precision, se obtiene el comportamiento deseado, es decir,
    % que al dividir dos cosas casi iguales se obtenga 1 (de nuevo, por cosas
    % raras de los numeros flotantes.
    argInterpolante = single((tInterpolado(ii) - tOriginal(jj)) / T);
    
%    funcionInterpolante = @tipoInterpolador;
    contribucion = yOriginal(jj) * fInterpolante(argInterpolante);
    % se acumulua
    yInterpolado(ii) += contribucion;
    
  % el valor de la muestra interpolada es igual a lo acumulado entre todas
  % las muestras originales
  end
% fin iteracion
end
