clear

% Cargar los espectros de todas las muestras obtenidas
rutaBase = 'grabaciones/analisis/';
tasasDeCaida = [49 95 113 232 342 508];
[dominio, espectros1] = cargarEspectros(rutaBase, tasasDeCaida);
rutaBase = 'grabaciones/prueba/';
[~, espectros2] = cargarEspectros(rutaBase, tasasDeCaida);

% Agrupar los espectros en una sola estructura
espectros = {};
for ii = 1 : length(espectros1)
    espectros{ii} = [espectros1{ii}; espectros2{ii}];
end

% Preparar el vector que contiene las abcisas
vTasasDeCaida = [];
for ii = 1 : length(tasasDeCaida)
    vTasasDeCaida = [vTasasDeCaida; tasasDeCaida(ii).*ones(10,1)];
end

% Calcular la energía en distintas bandas de frecuencia
energias = {};
bandas = {};
anchoVentanas = 20 : 10 : 200;
fraccionSolapamiento = 0.9;

mejorRCuadradoPorEnergia = 0;

for ii = 1 : length(anchoVentanas)
    limitesBandas = ventanearSenial(dominio, anchoVentanas(ii), fraccionSolapamiento);
    bandas{ii} = limitesBandas;
    energias{ii} = [];
    
    for jj = 1 : size(limitesBandas, 1)
        energiaBanda = zeros(60, 1);
        
        for kk = 1 : length(espectros)
            for hh = 1 : 10
                energiaBanda(10 * (kk-1) + hh) = norm(espectros{kk}(hh, (limitesBandas(jj, 1) : limitesBandas(jj, 2)))) ^ 2;
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

rectaEnergias = @(y) (y - mejorBPorEnergia(1)) ./ mejorBPorEnergia(2);

figure(1)
plot(vTasasDeCaida, energiasMejorRegresion, '*b', 'MarkerSize', 12)
hold on
fplot(rectaEnergias, [0 550]);
title(['Energía en la banda de ' ...
        num2str(dominio(limitesMejorBanda(1))) ' a ' num2str(dominio(limitesMejorBanda(2))) ...
        ' Hz. r^2 = ' num2str(mejorRCuadradoPorEnergia)])
xlabel('Tasa de caída de agua (mm/min)')
ylabel('Energía en la banda')
legend('off')
grid on

% Cálculo de regresiones de los cocientes entre energías de bandas
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
rectaCocientes = @(y) (y - mejorBCocientes(1)) ./ mejorBCocientes(2);

figure(2)
plot(vTasasDeCaida, mejoresCocientes, '*b', 'MarkerSize', 12)
hold on
fplot(rectaCocientes, [0 550])
str = {['Cociente entre las energías en las bandas de ' ...
        num2str(banda1(1)) ' - ' num2str(banda1(2)) ' Hz y ' ...
        num2str(banda2(1)) ' - ' num2str(banda2(2)) ' Hz'],
        ['r^2 = ' num2str(mejorRCuadradoCocientes)]};
title(str)
xlabel('Tasa de caída de agua (mm/min)')
ylabel('Cociente entre las energías de las bandas')
legend('off')
grid on
