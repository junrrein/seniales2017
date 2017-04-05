clear

[senial, fm] = audioread("PDS2016_GTP03/escala.wav");
tFinal = length(senial) / fm;
t = 0 : 1/fm : (tFinal - 1/fm);

nMuestrasPorSonido = floor(length(senial) / 8);
for ii = 1 : 8
    sonidos{ii} = senial((ii-1) * nMuestrasPorSonido + 1 : ii * nMuestrasPorSonido);
end

frecuenciaNotas = [261 293 329 349 392 440 493];

[~, senoidalDeComparacion] = senoidal(0, length(sonidos{1}) / fm, fm, 440, 1, 0);
maxProductoPunto = 0;

for kk = 1 : length(senoidalDeComparacion)
    productoPunto = abs(dot(sonidos{2}, senoidalDeComparacion));
    
    if (productoPunto > maxProductoPunto)
        maxProductoPunto = productoPunto;
    end
    
    senoidalDeComparacion = shift(senoidalDeComparacion, 1);
end


