clear

[senial, fm] = audioread("PDS2016_GTP03/escala.wav");
tFinal = length(senial) / fm;
t = 0 : 1/fm : (tFinal - 1/fm);

nMuestrasPorSonido = floor(length(senial) / 8);
for ii = 1 : 8
    sonidos{ii} = senial((ii-1) * nMuestrasPorSonido + 1 : ii * nMuestrasPorSonido);
end

nombreNotas = {"do" "re" "mi" "fa" "sol" "la" "si"};
frecuenciaNotas = [261 293 329 349 392 440 493];

for zz = 1 : length(sonidos)
  maxProductoPunto = zeros(1, length(frecuenciaNotas));
  
  for ii = 1 : length(frecuenciaNotas)
    for jj = -2 : 4
        for kk = 0 : 2*pi/90 : (2*pi - 1/90)
            fSenoidal = frecuenciaNotas(ii)*2^jj;
            tFinal = length(sonidos{zz}) / fm;
            [~, senoidalDeComparacion] = senoidal(0, tFinal, fm, fSenoidal, 1, kk);
            
            productoPunto = abs(dot(sonidos{zz}, senoidalDeComparacion));
            
            if (productoPunto > maxProductoPunto(ii))
                maxProductoPunto(ii) = productoPunto;
            end
        end
    end
  end

  notaTocadaIndice = find(maxProductoPunto == max(maxProductoPunto));
  notaTocada{zz} = nombreNotas{notaTocadaIndice};
end
