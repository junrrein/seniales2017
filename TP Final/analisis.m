clear

[~, fm] = audioread("grabaciones/analisis/508/Clip 10");

% Se utilizan muestras de 2 segundos
nMuestras = 2 * fm;

% Mapa de indice en el cell array de audios a mm/min
mmIndexMap = [49 95 113 232 342 508];

% Cell array que va a contener 1 elemento por tasa de caida de agua
% Cada elemento es una matriz de 5 x nMuestras
audios = {};

% Carga de audios
rutaBase = 'grabaciones/analisis/';

for ii = 1 : length(mmIndexMap)
  audios{ii} = zeros(5, nMuestras);
  sufijo =  num2str(mmIndexMap(ii));
  
  % Cargo la lista de archivos de audio.
  % Lo que devuelve ls es una matriz de char, por eso
  % sliceamos el resultado por filas.
  % Usamos los primeros 5 elementos de la lista porque
  % el sexto es muestraInicio.txt
  listaArchivos = ls([rutaBase sufijo])(1:5, :);
  
  % Cargamos la posicion de inicio de cada audio
  muestraInicio = load([rutaBase sufijo '/muestraInicio.txt']);
  
  % Cargamos cada audio en la matriz
  for jj = 1 : size(listaArchivos)(1)
    audio = audioread([rutaBase sufijo '/' listaArchivos(jj, 1:7)]);
    
    % Se recorta
    audio = audio(muestraInicio(jj) : muestraInicio(jj) + nMuestras - 1);
    
    % Se normalizan las señales
    audios{ii}(jj, :) = audio / norm(audio);
  end
end

% Se obtiene el espectro de las señales
dominioFrecuencial = plotFFT(audios{1}(1, :), fm, false);
espectros = {};

for ii = 1 : length(audios)
  espectros{ii} = zeros(5, nMuestras);
  
  for jj = 1 : 5
    espectros{ii}(jj, :) = fftshift(abs(fft(audios{ii}(jj, :))));
  end
end

% Se calcula la energía para distintas bandas de frecuencia
bandas = [100 170; 170 230; 550 650; 900 1025; 900 1150];
energias = {};

for ii = 1 : length(espectros)
  energias{ii} = zeros(5, size(bandas, 1));
  
  for jj = 1 : 5
      for kk = 1 : size(bandas, 1)
        limInferior = find(dominioFrecuencial >= bandas(kk, 1))(1);
        limSuperior = find(dominioFrecuencial >= bandas(kk, 2))(1);
        energiaBanda = norm(espectros{ii}(jj, (limInferior : limSuperior))) ^ 2;
        
        energias{ii}(jj, kk) = energiaBanda;
    end
  end
end

close all

% Se grafica la energía para las distintas bandas de frecuencia
figure(1)
for ii = 1 : size(bandas, 1)
  subplot(3, 2, ii)
  
  for jj = 1 : length(energias)
    plot(ones(1, 5) .* mmIndexMap(jj), energias{jj}(:, ii), '*b', 'MarkerSize', 12)
    hold on
  end
  
    title([num2str(bandas(ii,1)) ' - ' num2str(bandas(ii,2)) ' Hz']);
    xlabel('Tasa de caída de agua (mm/min)')
    ylabel('Energía')
    grid on
end
suplabel('Energía en distintas bandas de frecuencia', 't');
setFontSize(12)

% Se grafica el sonograma de alguna de las señales
espectrosAGraficar = [1 1 1 1 1 2];
limiteFrecuencia = 1500;
limiteMagnitud = 10;

figure(2)
for ii = 1 : length(espectrosAGraficar)
    subplot(3, 2, ii)
    espectro = espectros{ii}(espectrosAGraficar(ii), :);
    plot(dominioFrecuencial, espectro);
    title([num2str(mmIndexMap(ii)) ' mm/min'])
    xlabel('Frecuencia (Hz)')
    ylabel('|X(k)|')
    xlim([200 400])
    ylim([0 limiteMagnitud])
    grid on
end
suplabel('Espectro normalizado de señales con distintas tasas de caída de agua', 't');
setFontSize(12)

% Se calculan los cocientes entre banda a y banda b
% Se ven "mejores" los pares 1-2, 4-5
bandaA = 1;
bandaB = 2;
cocientes = {};
for ii = 1 : length(energias)
    cocientes{ii} = energias{ii}(:, bandaA) ./ energias{ii}(:, bandaB);
end

% Se grafican los cocientes anteriores
%figure(3)
%for ii = 1 : length(cocientes)
%    plot(mmIndexMap(ii) .* ones(1, 5), cocientes{ii}, '*b', 'MarkerSize', 12)
%    hold on
%end
%title(['Cociente entre las bandas de energía '...
%        num2str(bandas(bandaA, 1)) ' - ' num2str(bandas(bandaA,2)) ' Hz y '...
%        num2str(bandas(bandaB, 1)) ' - ' num2str(bandas(bandaB,2)) ' Hz'])
%xlabel('Tasa de caída de agua (mm/min)')
%ylabel('Magnitud del cociente')
%grid on
%setFontSize(12)

% Se calcula el centro de gravedad de los espectros
centros = {};
for ii = 1 : length(espectros)
    centros{ii} = zeros(5, 1);
    suma = zeros(5, 1);
    indiceCero = find(dominioFrecuencial == 0);
    indice1500 = find(dominioFrecuencial == 1500);
    
    for jj = indiceCero : indice1500
        suma += espectros{ii}(:, jj);
        centros{ii} += (espectros{ii}(:, jj) * dominioFrecuencial(jj));
    end
    
    centros{ii} ./= suma;
end

% Se grafican los centros de gravedad de los espectros
figure(4)
for ii = 1 : length(centros)
    plot(mmIndexMap(ii) .* ones(5, 1), centros{ii}, '*b', 'MarkerSize', 12)
    hold on
end
title('Centro de gravedad de los espectros para distintas tasas de caída de agua')
xlabel('Tasa de caída de agua (mm/min)')
ylabel('Centro de gravedad')
grid on
setFontSize(12)

% Se hace una regresión lineal sobre los centros de gravedad
xRegresion = [];
yRegresion = [];
for ii = 1 : length(centros)
    xRegresion = [xRegresion; mmIndexMap(ii).*ones(5,1)];
    yRegresion = [yRegresion; centros{ii}];
end

[B, rCuadrado] = regresionLineal(xRegresion, yRegresion);
f = @(x) B(1) + B(2) * x;
fplot(f, [0 1500])
