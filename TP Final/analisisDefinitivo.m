clear

rutaBase = 'grabaciones/analisis/';
tasasDeCaida = [49 95 113 232 342 508];
[dominio, espectros] = cargarEspectros(rutaBase, tasasDeCaida);

% Regresion lineal utilizando la energia en distintas bandas de frecuencia
anchoVentanas = 20 : 10 : 200;
fraccionSolapamiento = 0.9;
mejorRCuadradoPorEnergia = 0;
xRegresion = [];
for ii = 1 : length(tasasDeCaida)
    xRegresion = [xRegresion; tasasDeCaida(ii).*ones(5,1)];
end

for ancho = anchoVentanas
    limitesBandas = ventanearSenial(dominio, ancho, fraccionSolapamiento);
    
    for jj = 1 : size(limitesBandas, 1)
        energiaBanda = zeros(30, 1);
        
        for kk = 1 : length(espectros)
            for hh = 1 : 5
                energiaBanda(5 * (kk-1) + hh) = norm(espectros{kk}(hh, (limitesBandas(jj, 1) : limitesBandas(jj, 2)))) ^ 2;
            end
        end
        
        [B, rCuadrado] = regresionLineal(xRegresion, energiaBanda);
        
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
plot(xRegresion, energiasMejorRegresion, '*b', 'MarkerSize', 12)
hold on
fplot(rectaEnergias, [0 550]);
title(['Energía en la banda de ' ...
        num2str(dominio(limitesMejorBanda(1))) ' a ' num2str(dominio(limitesMejorBanda(2))) ...
        ' Hz. r^2 = ' num2str(mejorRCuadradoPorEnergia)])
xlabel('Tasa de caída de agua (mm/min)')
ylabel('Energía')
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

    [B, rCuadrado] = regresionLineal(xRegresion, centros);
    
    if (rCuadrado > mejorRCuadradoCentros)
        mejorLimiteSuperior = dominio(limiteEnMuestras);
        mejorRCuadradoCentros = rCuadrado;
        mejorBCentros = B;
        mejoresCentros = centros;
    end
    
end

rectaCentros = @(x) mejorBCentros(1) + mejorBCentros(2) * x;

figure(2)
plot(xRegresion, mejoresCentros, '*b', 'MarkerSize', 12)
hold on
fplot(rectaCentros, [0 550])
title(['Centro de gravedad de los espectros para distintas tasas de caída de agua, ' ...
       'calculado en la banda de 0 a ' num2str(mejorLimiteSuperior) ' Hz. r^2 = ' ...
       num2str(mejorRCuadradoCentros)])
xlabel('Tasa de caída de agua (mm/min)')
ylabel('Frecuencia (Hz)')
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

    [B, rCuadrado] = regresionLineal(xRegresion, centros);
    
    if (rCuadrado > mejorRCuadradoCentrosInv)
        mejorLimiteInferior = dominio(limiteEnMuestras);
        mejorRCuadradoCentrosInv = rCuadrado;
        mejorBCentrosInv = B;
        mejoresCentrosInv = centros;
    end
end

rectaCentrosInv = @(x) mejorBCentrosInv(1) + mejorBCentrosInv(2) * x;

figure(3)
plot(xRegresion, mejoresCentrosInv, '*b', 'MarkerSize', 12)
hold on
fplot(rectaCentrosInv, [0 550])
title(['Centro de gravedad de los espectros para distintas tasas de caída de agua, ' ...
       'calculado en la banda de ' num2str(mejorLimiteInferior) 'a 1500 Hz. r^2 = ' ...
       num2str(mejorRCuadradoCentrosInv)])
xlabel('Tasa de caída de agua (mm/min)')
ylabel('Frecuencia (Hz)')
legend('off')
grid on
