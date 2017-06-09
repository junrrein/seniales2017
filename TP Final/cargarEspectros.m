function [dominio, espectros] = cargarEspectros(rutaBase, sufijos)
% Entradas:
% rutaBase:     string que da la ruta base al lugar donde se encuentran las
%               carpetas de grabaciones.
% sufijos:      array de enteros que dan el nombre de las carpetas que contienen
%               grabaciones bajo la ruta base.
% Salidas:
% dominio:      vector de floats; dominio frecuencial de los espectros
% espectros:    cell array de dos dimensiones; la primer dimensión se corresponde
%               a una tasa de caída de agua, la segunda dimensión se corresponde
%               al espectro de una muestra, que es un array de floats.
% Los espectros devueltos sólo contienen valores en el rango de 0 a 1500 Hz.

% Se convierten los sufijos a strings
sufijosString = {};
for ii = 1 : length(sufijos)
    sufijosString{ii} = num2str(sufijos(ii));
end

% Cell array bidimensional
% 1ra dimensión: Tasa de caída de agua
% 2da dimensión: Vector que corresponde a una muestra
audios = {};

for ii = 1 : length(sufijosString)
  % Cargo la lista de archivos de audio.
  % Lo que devuelve ls es una matriz de char, por eso
  % sliceamos el resultado por filas.
  % Usamos los primeros 5 elementos de la lista porque
  % el sexto es muestraInicio.txt
  listaArchivos = ls([rutaBase sufijosString{ii}])(1:5, :);
  
  % Cargamos la posicion de inicio de cada audio
  muestraInicio = load([rutaBase sufijosString{ii} '/muestraInicio.txt']);
  
  % Cargamos cada audio en la matriz
  for jj = 1 : size(listaArchivos)(1)
    [audio, fm] = audioread([rutaBase sufijosString{ii} '/' listaArchivos(jj, 1:7)]);
    
    % Se toma una ventana de 2 segundos
    nMuestras = 2 * fm;
    audio = audio(muestraInicio(jj) : muestraInicio(jj) + nMuestras - 1);
    
    % Se normaliza la señal
    audios{ii, jj} = audio / norm(audio);
  end
end

% Se obtiene el espectro de las señales
dominioFrecuencial = plotFFT(audios{1, 1}, fm, false);

% Se va a utilizar el rango de 0 a 1500 Hz
indiceCero = find(dominioFrecuencial == 0);
indice1500 = find(dominioFrecuencial == 1500);

if isempty(indiceCero) || isempty(indice1500)
    error("Revisá esta línea cacho")
end

dominio = dominioFrecuencial(indiceCero : indice1500);

espectros = {};

for ii = 1 : length(audios)
    espectros{ii} = zeros(5, indice1500 - indiceCero + 1);
      for jj = 1 : 5
        espectro = fftshift(abs(fft(audios{ii, jj})));
        espectros{ii}(jj, :) = espectro(indiceCero : indice1500);
      end
end
