clear

[senial, fm] = audioread("PDS2016_GTP03/escala.wav");
senial = senial';
tFinal = length(senial) / fm;
t = 0 : 1/fm : (tFinal - 1/fm);

nMuestrasPorSonido = floor(length(senial) / 8);
sonidos = zeros(8, nMuestrasPorSonido);
for ii = 1 : 8
    sonidos(ii, :) = senial((ii-1) * nMuestrasPorSonido + 1 : ii * nMuestrasPorSonido);
end

nombreNotas = {"do" "re" "mi" "fa" "sol" "la" "si"};
frecuenciaNotas = [261 293 329 349 392 440 493];

tic

maximosSonidosXNotas = zeros(size(sonidos, 1), length(frecuenciaNotas));
senoidales = zeros(nMuestrasPorSonido, 90 * 6); % 6 es el número de armónicos
                                                % 90 son las variaciones de fase
tFinal = nMuestrasPorSonido / fm;

for ii = 1 : length(frecuenciaNotas)
    for jj = -2 : 3
        fSenoidal = frecuenciaNotas(ii) * 2^jj;
           
        for kk = 1 : 90
            fase = (kk - 1) * 2*pi / 90;
            [~, senoidalDeComparacion] = senoidal(0, tFinal, fm, fSenoidal, 1, fase);
            senoidales(:, kk + 90*(jj + 2)) = senoidalDeComparacion;
        end
    end

    % Se realiza el producto punto entre todos los sonidos contra todas las senoidales de una nota dada.
    productosPunto = sonidos * senoidales;
    maximosSonidosXNotas(:, ii) = max(productosPunto, [], 2);
end

bitmapSonidosXNotas = maximosSonidosXNotas == max(maximosSonidosXNotas, [], 2 );

for ii = 1 : length(nombreNotas)
    indices = bitmapSonidosXNotas(:, ii);
    notaTocadaIndex(indices) = ii;
end

notasTocadas = nombreNotas(notaTocadaIndex);

toc
