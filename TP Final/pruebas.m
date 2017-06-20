clear

rutaBase = 'grabaciones/prueba/';
tasasDeCaida = [49 95 113 232 342 508];
[dominio, espectros] = cargarEspectros(rutaBase, tasasDeCaida);

load('resultadosAnalisis')

% Pruebas utilizando energia en una banda
energias = zeros(30, 1);
for ii = 1 : length(espectros)
    for jj = 1 : 5
        energias(5 * (ii-1) + jj) = norm(espectros{ii}(jj, (limitesMejorBanda(1) : limitesMejorBanda(2)))) ^ 2;
    end
end

regresionEnergias = mejorBPorEnergia(1) + mejorBPorEnergia(2) * energias;
rCuadradoEnergia = 1 - sum((vTasasDeCaida - regresionEnergias).^2)/sum((vTasasDeCaida - mean(vTasasDeCaida)).^2);

close all

%figure(1)
subplot(2, 1, 1)
plot(vTasasDeCaida, energiasMejorRegresion, '*o', 'MarkerSize', 10, 'LineWidth', 2)
hold on
fplot(rectaEnergias, [0 550], '--');
set(findobj(gca, 'Type', 'Line', 'Linestyle', '--'), 'LineWidth', 2);
title(['Calculado en los datos de analisis. r^2 = ' num2str(mejorRCuadradoPorEnergia)])
xlabel('Tasa de caida de agua (mm/min)')
ylabel('Energia en la banda')
legend('off')
grid on

subplot(2, 1, 2)
plot(vTasasDeCaida, energias, '*o', 'MarkerSize', 10, 'LineWidth', 2)
hold on
fplot(rectaEnergias, [0 550], '--');
set(findobj(gca, 'Type', 'Line', 'Linestyle', '--'), 'LineWidth', 2);
title(['Calculado en los datos de validacion. r^2 = ' num2str(rCuadradoEnergia)])
xlabel('Tasa de caida de agua (mm/min)')
ylabel('Energia en la banda')
legend('off')
grid on

suplabel(['Energia en la banda de ' ...
        num2str(dominio(limitesMejorBanda(1))) ' a ' num2str(dominio(limitesMejorBanda(2))) ...
        ' Hz'], 't')
setFontSize(13)

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
subplot(2, 1, 1)
plot(vTasasDeCaida, mejoresCentros, 'ok', 'MarkerSize', 10, 'LineWidth', 2)
hold on
fplot(rectaCentros, [0 550], '--')
set(findobj(gca, 'Type', 'Line', 'Linestyle', '--'), 'LineWidth', 2);
title(['Calculado en los datos de analisis. r^2 = ' num2str(mejorRCuadradoCentros)])
xlabel('Tasa de caida de agua (mm/min)')
ylabel('Centro de gravedad (Hz)')
legend('off')
grid on

subplot(2, 1, 2)
plot(vTasasDeCaida, centros, 'ok', 'MarkerSize', 10, 'LineWidth', 2)
hold on
fplot(rectaCentros, [0 550], '--')
set(findobj(gca, 'Type', 'Line', 'Linestyle', '--'), 'LineWidth', 2);
title(['Calculado en los datos de validacion. r^2 = ' num2str(rCuadradoCentros)])
xlabel('Tasa de caida de agua (mm/min)')
ylabel('Centro de gravedad(Hz)')
legend('off')
grid on

suplabel(['Centro de gravedad del espectro, ' ...
       'calculado en la banda de 0 a ' num2str(mejorLimiteSuperior) ' Hz'], 't');
setFontSize(13)

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
subplot(2, 1 , 1)
plot(vTasasDeCaida, mejoresCentrosInv, 'ok', 'MarkerSize', 10, 'LineWidth', 2)
hold on
fplot(rectaCentrosInv, [0 550], '--')
set(findobj(gca, 'Type', 'Line', 'Linestyle', '--'), 'LineWidth', 2);
title(['Calculado en los datos de analisis. r^2 = ' num2str(mejorRCuadradoCentrosInv)])
xlabel('Tasa de caida de agua (mm/min)')
ylabel('Centro de gravedad (Hz)')
legend('off')
grid on

subplot(2, 1 , 2)
plot(vTasasDeCaida, centrosInv, 'ok', 'MarkerSize', 10, 'LineWidth', 2)
hold on
fplot(rectaCentrosInv, [0 550], '--')
set(findobj(gca, 'Type', 'Line', 'Linestyle', '--'), 'LineWidth', 2);
title(['Calculado en los datos de validacion. r^2 = ' num2str(rCuadradoCentrosInv)])
xlabel('Tasa de caida de agua (mm/min)')
ylabel('Centro de gravedad (Hz)')
legend('off')
grid on

suplabel(['Centro de gravedad del espectro, calculado en la banda de ' num2str(mejorLimiteInferior) ' a 1500 Hz'], 't');
setFontSize(13)

% Pruebas calculando el cociente entre la energia en dos bandas
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
subplot(2, 1, 1)
plot(vTasasDeCaida, mejoresCocientes, 'ok', 'MarkerSize', 10, 'LineWidth', 2)
hold on
fplot(rectaCocientes, [0 550], '--')
set(findobj(gca, 'Type', 'Line', 'Linestyle', '--'), 'LineWidth', 2);
title(['Calculado en los datos de analisis. r^2 = ' num2str(mejorRCuadradoCocientes)])
xlabel('Tasa de caida de agua (mm/min)')
ylabel('Cociente')
legend('off')
grid on

subplot(2, 1, 2)
plot(vTasasDeCaida, cocientes, 'ok', 'MarkerSize', 10, 'LineWidth', 2)
hold on
fplot(rectaCocientes, [0 550], '--')
set(findobj(gca, 'Type', 'Line', 'Linestyle', '--'), 'LineWidth', 2);
title(['Calculado en los datos de validacion. r^2 = ' num2str(rCuadradoCocientes)])
xlabel('Tasa de caida de agua (mm/min)')
ylabel('Cociente')
legend('off')
grid on

suplabel(['Cociente entre las energias en las bandas de ' ...
        num2str(banda1(1)) ' - ' num2str(banda1(2)) ' Hz y ' ...
        num2str(banda2(1)) ' - ' num2str(banda2(2)) ' Hz'], 't');
setFontSize(13)
