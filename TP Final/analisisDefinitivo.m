clear

rutaBase = 'grabaciones/analisis/';
tasasDeCaida = [49 95 113 232 342 508];
[dominio, espectros] = cargarEspectros(rutaBase, tasasDeCaida);

vTasasDeCaida = [];
for ii = 1 : length(tasasDeCaida)
    vTasasDeCaida = [vTasasDeCaida; tasasDeCaida(ii).*ones(5,1)];
end

% Regresion lineal utilizando la energia en distintas bandas de frecuencia
anchoVentanas = 20 : 10 : 200;
fraccionSolapamiento = 0.9;
mejorRCuadradoPorEnergia = 0;

energias = {};
bandas = {};

for ii = 1 : length(anchoVentanas)
    limitesBandas = ventanearSenial(dominio, anchoVentanas(ii), fraccionSolapamiento);
    bandas{ii} = limitesBandas;
    energias{ii} = [];
    
    for jj = 1 : size(limitesBandas, 1)
        energiaBanda = zeros(30, 1);
        
        for kk = 1 : length(espectros)
            for hh = 1 : 5
                energiaBanda(5 * (kk-1) + hh) = norm(espectros{kk}(hh, (limitesBandas(jj, 1) : limitesBandas(jj, 2)))) ^ 2;
            end
        end
        
        energias{ii} = [energias{ii} ; energiaBanda'];
        
        [B, rCuadrado] = regresionLineal(energiaBanda, vTasasDeCaida);
        
        if (rCuadrado > mejorRCuadradoPorEnergia)
            limitesMejorBanda = limitesBandas(jj, :);
            mejorBPorEnergia = B;
            mejorRCuadradoPorEnergia = rCuadrado;
            energiasMejorRegresion = energiaBanda;
        end
    end
end

close all

rectaEnergias = @(x) mejorBPorEnergia(1) + mejorBPorEnergia(2) * x;

figure(1)
plot(energiasMejorRegresion, vTasasDeCaida, '*b', 'MarkerSize', 12)
hold on
fplot(rectaEnergias, [100 600]);
title(['Energía en la banda de ' ...
        num2str(dominio(limitesMejorBanda(1))) ' a ' num2str(dominio(limitesMejorBanda(2))) ...
        ' Hz. r^2 = ' num2str(mejorRCuadradoPorEnergia)])
ylabel('Tasa de caída de agua (mm/min)')
xlabel('Energía en la banda')
legend('off')
grid on

% Regresion lineal utilizando los centros de gravedad de los espectros
limiteSuperiorHz = 250 : 50 : 1500;
mejorRCuadradoCentros = 0;

for limite = limiteSuperiorHz
    centros = [];
    limiteEnMuestras = find(dominio == limite);
    
    if (isempty(limiteEnMuestras))
        error('Mirá esto cacho')
    end
    
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

    [B, rCuadrado] = regresionLineal(centros, vTasasDeCaida);
    
    if (rCuadrado > mejorRCuadradoCentros)
        mejorLimiteSuperior = dominio(limiteEnMuestras);
        mejorRCuadradoCentros = rCuadrado;
        mejorBCentros = B;
        mejoresCentros = centros;
    end
    
end

rectaCentros = @(x) mejorBCentros(1) + mejorBCentros(2) * x;

figure(2)
plot(mejoresCentros, vTasasDeCaida, '*b', 'MarkerSize', 12)
hold on
fplot(rectaCentros, [400 550])
title(['Centro de gravedad de los espectros para distintas tasas de caída de agua, ' ...
       'calculado en la banda de 0 a ' num2str(mejorLimiteSuperior) ' Hz. r^2 = ' ...
       num2str(mejorRCuadradoCentros)])
ylabel('Tasa de caída de agua (mm/min)')
xlabel('Centro de gravedad del espectro (Hz)')
legend('off')
grid on

% Regresion lineal utilizando los centros de gravedad de los espectros
limiteInferiorHz = 0 : 50 : 1250;
mejorRCuadradoCentrosInv = 0;

for limite = limiteInferiorHz
    centros = [];
    limiteEnMuestras = find(dominio == limite);
    
    if (isempty(limiteEnMuestras))
        error('Mirá esto cacho')
    end
    
    for ii = 1 : length(espectros)
        centrosTemp = zeros(5, 1);
        suma = zeros(5, 1);
        
        for jj = limiteEnMuestras : 1500
            suma += espectros{ii}(:, jj);
            centrosTemp += (espectros{ii}(:, jj) * dominio(jj));
        end
        
        centrosTemp ./= suma;
        
        centros = [centros; centrosTemp];
    end

    [B, rCuadrado] = regresionLineal(centros, vTasasDeCaida);
    
    if (rCuadrado > mejorRCuadradoCentrosInv)
        mejorLimiteInferior = dominio(limiteEnMuestras);
        mejorRCuadradoCentrosInv = rCuadrado;
        mejorBCentrosInv = B;
        mejoresCentrosInv = centros;
    end
end

rectaCentrosInv = @(x) mejorBCentrosInv(1) + mejorBCentrosInv(2) * x;

figure(3)
plot(mejoresCentrosInv, vTasasDeCaida, '*b', 'MarkerSize', 12)
hold on
fplot(rectaCentrosInv, [300 500])
title(['Centro de gravedad de los espectros para distintas tasas de caída de agua, ' ...
       'calculado en la banda de ' num2str(mejorLimiteInferior) ' a 1500 Hz. r^2 = ' ...
       num2str(mejorRCuadradoCentrosInv)])
ylabel('Tasa de caída de agua (mm/min)')
xlabel('Centro de gravedad del espectro (Hz)')
legend('off')
grid on

% Analisis de cocientes
mejorRCuadradoCocientes = 0;

for ii = 1 : length(energias)
    for jj = 1 : rows(energias{ii})
        for kk = jj + 1 : rows(energias{ii})
            cocientes = energias{ii}(jj,:) ./ energias{ii}(kk,:);
            
            [B, rCuadrado] = regresionLineal(cocientes', vTasasDeCaida);
    
            if (rCuadrado > mejorRCuadradoCocientes)
                mejorBandaNumerador = bandas{ii}(jj,:);
                mejorBandaDenominador = bandas{ii}(kk,:);
                mejorRCuadradoCocientes = rCuadrado;
                mejorBCocientes = B;
                mejoresCocientes = cocientes';
            end
        end    
    end
end

banda1 = dominio(mejorBandaNumerador);
banda2 = dominio(mejorBandaDenominador);
rectaCocientes = @(x) mejorBCocientes(1) + mejorBCocientes(2) * x;

figure(4)
plot(mejoresCocientes, vTasasDeCaida, '*b', 'MarkerSize', 12)
hold on
fplot(rectaCocientes, [0 0.8])
title(['Cociente entre las energías en las bandas de ' ...
        num2str(banda1(1)) ' - ' num2str(banda1(2)) ' Hz y ' ...
        num2str(banda2(1)) ' - ' num2str(banda2(2)) ' Hz. ' ...
        'r^2 = ' num2str(mejorRCuadradoCocientes)])
ylabel('Tasa de caída de agua (mm/min)')
xlabel('Cociente entre las energías de las bandas')
legend('off')
grid on

save resultadosAnalisis vTasasDeCaida ...
    limitesMejorBanda mejorBPorEnergia mejorRCuadradoPorEnergia energiasMejorRegresion rectaEnergias ...
    mejorLimiteSuperior mejorRCuadradoCentros mejorBCentros mejoresCentros rectaCentros ...
    mejorLimiteInferior mejorRCuadradoCentrosInv mejorBCentrosInv mejoresCentrosInv rectaCentrosInv ...
    mejorBandaNumerador mejorBandaDenominador mejorRCuadradoCocientes mejorBCocientes mejoresCocientes rectaCocientes;