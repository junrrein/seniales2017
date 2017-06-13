clear

rutaBase = 'grabaciones/prueba/';
tasasDeCaida = [49 95 113 232 342 508];
[dominio, espectros] = cargarEspectros(rutaBase, tasasDeCaida);

load('resultadosAnalisis')

% Pruebas utilizando energía en una banda
energias = zeros(30, 1);
for ii = 1 : length(espectros)
    for jj = 1 : 5
        energias(5 * (ii-1) + jj) = norm(espectros{ii}(jj, (limitesMejorBanda(1) : limitesMejorBanda(2)))) ^ 2;
    end
end

regresionEnergias = mejorBPorEnergia(1) + mejorBPorEnergia(2) * energias;
rCuadradoEnergia = 1 - sum((vTasasDeCaida - regresionEnergias).^2)/sum((vTasasDeCaida - mean(vTasasDeCaida)).^2);

close all

figure(1)
plot(vTasasDeCaida, energias, '*b', 'MarkerSize', 12)
hold on
fplot(rectaEnergias, [0 550]);
title(['Energía en la banda de ' ...
        num2str(dominio(limitesMejorBanda(1))) ' a ' num2str(dominio(limitesMejorBanda(2))) ...
        ' Hz. r^2 = ' num2str(rCuadradoEnergia)])
xlabel('Tasa de caída de agua (mm/min)')
ylabel('Energía en la banda')
legend('off')
grid on

% Pruebas calculando el centro de gravedad hacia la izquierda
centros = [];
limiteEnMuestras = find(dominio == mejorLimiteSuperior);
for ii = 1 : length(espectros)
    centrosTemp = zeros(5, 1);
    suma = zeros(5, 1);
    
    for jj = 1 : limiteEnMuestras
        suma += espectros{ii}(:, jj);
        centrosTemp += (espectros{ii}(:, jj) * dominio(jj));
    end
    
    centrosTemp ./= suma;
    
    centros = [centros; centrosTemp];
end

regresionCentros = mejorBCentros(1) + mejorBCentros(2) * centros;
rCuadradoCentros = 1 - sum((vTasasDeCaida - regresionCentros).^2)/sum((vTasasDeCaida - mean(vTasasDeCaida)).^2);

figure(2)
plot(vTasasDeCaida, centros, '*b', 'MarkerSize', 12)
hold on
fplot(rectaCentros, [0 550])
str = {'Centro de gravedad del espectro para distintas tasas de caída de agua, ',
       ['calculado en la banda de 0 a ' num2str(mejorLimiteSuperior) ' Hz. r^2 = ' ...
       num2str(rCuadradoCentros)]};
title(str)
xlabel('Tasa de caída de agua (mm/min)')
ylabel('Centro de gravedad del espectro (Hz)')
legend('off')
grid on

% Pruebas calculando el centro de gravedad hacia la derecha
centrosInv = [];
limiteEnMuestras = find(dominio == mejorLimiteInferior);
for ii = 1 : length(espectros)
    centrosTemp = zeros(5, 1);
    suma = zeros(5, 1);
    
    for jj = limiteEnMuestras : 1500
        suma += espectros{ii}(:, jj);
        centrosTemp += (espectros{ii}(:, jj) * dominio(jj));
    end
    
    centrosTemp ./= suma;
    
    centrosInv = [centrosInv; centrosTemp];
end

regresionCentrosInv = mejorBCentrosInv(1) + mejorBCentrosInv(2) * centrosInv;
rCuadradoCentrosInv = 1 - sum((vTasasDeCaida - regresionCentrosInv).^2)/sum((vTasasDeCaida - mean(vTasasDeCaida)).^2);

figure(3)
plot(vTasasDeCaida, centrosInv, '*b', 'MarkerSize', 12)
hold on
fplot(rectaCentrosInv, [0 550])
str = {'Centro de gravedad del espectro para distintas tasas de caída de agua, ',
       ['calculado en la banda de ' num2str(mejorLimiteInferior) ' a 1500 Hz. r^2 = ' ...
       num2str(rCuadradoCentrosInv)]};
title(str)
xlabel('Tasa de caída de agua (mm/min)')
ylabel('Centro de gravedad del espectro (Hz)')
legend('off')
grid on

% Pruebas calculando el cociente entre la energía en dos bandas
energiasBanda1 = [];
energiasBanda2 = [];

for ii = 1 : length(espectros)
    for jj = 1 : 5
        energiasBanda1(5 * (ii-1) + jj) = norm(espectros{ii}(jj, (mejorBandaNumerador(1) : mejorBandaNumerador(2)))) ^ 2;
        energiasBanda2(5 * (ii-1) + jj) = norm(espectros{ii}(jj, (mejorBandaDenominador(1) : mejorBandaDenominador(2)))) ^ 2;
    end
end

cocientes = (energiasBanda1 ./ energiasBanda2)';
regresionCocientes = mejorBCocientes(1) + mejorBCocientes(2) * cocientes;
rCuadradoCocientes = 1 - sum((vTasasDeCaida - regresionCocientes).^2)/sum((vTasasDeCaida - mean(vTasasDeCaida)).^2);

banda1 = dominio(mejorBandaNumerador);
banda2 = dominio(mejorBandaDenominador);

figure(4)
plot(vTasasDeCaida, cocientes, '*b', 'MarkerSize', 12)
hold on
fplot(rectaCocientes, [0 550])
str = {['Cociente entre las energías en las bandas de ' ...
        num2str(banda1(1)) ' - ' num2str(banda1(2)) ' Hz y ' ...
        num2str(banda2(1)) ' - ' num2str(banda2(2)) ' Hz'],
        ['r^2 = ' num2str(rCuadradoCocientes)]};
title(str)
xlabel('Tasa de caída de agua (mm/min)')
ylabel('Cociente entre las energías de las bandas')
legend('off')
grid on
