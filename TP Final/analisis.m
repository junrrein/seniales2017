clear

[~, fm] = audioread("grabaciones/analisis/508/Clip 10");

% Se utilizan muestras de 2 segundos
nMuestras = 2 * fm;

% Mapa de indice en el cell array de audios a mm/min
mmIndexMap = [49 95 113 232 342 508];

% Cell array que va a contener 1 elemento por tasa de caida de agua
% Cada elemento es una matriz de 5 x nMuestras
audios = {};

rutaBase = 'grabaciones/analisis/';

ventana = hanning(nMuestras);

% Carga de audios
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
    audios{ii}(jj, :) = audio(muestraInicio : muestraInicio + nMuestras - 1);
  end
end

% Se obtiene el espectro de las señales
dominioFrecuencial = plotFFT(audios{1}(1, :), fm, @plot, false);
espectros = {};
for ii = 1 : length(audios)
  espectros{ii} = zeros(5, nMuestras);
  
  for jj = 1 : 5
    espectros{ii}(jj, :) = fftshift(abs(fft(audios{ii}(jj, :))));
  end
end

cocientes = {};

bandas = [100 170; 170 230; 550 650; 900 1025; 900 1150];

for ii = 1 : length(espectros)
  cocientes{ii} = zeros(5, size(bandas, 1));
  
  for jj = 1 : 5
      for kk = 1 : size(bandas, 1)
        limInferior = find(dominioFrecuencial >= bandas(kk, 1))(1);
        limSuperior = find(dominioFrecuencial >= bandas(kk, 2))(1);
        energiaBanda = norm(espectros{ii}(jj, (limInferior : limSuperior))) ^ 2;
        
        cocientes{ii}(jj, kk) = energiaBanda;
    end
  end
end

close all
figure

for ii = 1 : size(bandas, 1)
  subplot(3, 2, ii)
  
  for jj = 1 : length(cocientes)
      plot(ones(1, 5) .* mmIndexMap(jj), cocientes{jj}(:, ii), '*r', 'MarkerSize', 12)
      title([num2str(bandas(ii,1)) ' : ' num2str(bandas(ii,2))]);
      hold on
  end
end
