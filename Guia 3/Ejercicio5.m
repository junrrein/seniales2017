clear

numeros = [1 2 3; 4 5 6; 7 8 9; nan 0 nan];
frecuenciaFila = [697 770 852 941];
frecuenciaColumna = [1209 1336 1477];

senial = load("PDS2016_GTP03/te.txt");
fm = 11025;
tFinal = length(senial) / fm;
t = 0 : 1/fm : (tFinal - 1/fm);

%plot(senial)

digitos{1} = senial(17000 : 21000);
digitos{2} = senial(30000 : 34000);
digitos{3} = senial(39500 : 43000);
digitos{4} = senial(48500 : 52500);
digitos{5} = senial(58500 : 63500);
digitos{6} = senial(69500 : 74500);
digitos{7} = senial(80500 : 85500);

numeroDiscado = zeros(1, length(digitos));

for ii = 1 : length(digitos)
    % Para determinar la fila
    maxProductoPuntoFila = zeros(1, length(frecuenciaFila));

    for jj = 1 : length(frecuenciaFila)
        [~, senoidalDeComparacion] = senoidal(0, length(digitos{ii})/fm, fm, frecuenciaFila(jj), 1, 0);

        for kk = 1 : length(senoidalDeComparacion)
            productoPunto = abs(dot(digitos{ii}, senoidalDeComparacion));

            if (productoPunto > maxProductoPuntoFila(jj))
                maxProductoPuntoFila(jj) = productoPunto;
            end
            
            senoidalDeComparacion = shift(senoidalDeComparacion, 1);
        end
    end

    indiceFila = find(maxProductoPuntoFila == max(maxProductoPuntoFila));

    % Para determinar la columna
    maxProductoPuntoColumna = zeros(1, length(frecuenciaColumna));

    for jj = 1 : length(frecuenciaColumna)
        [~, senoidalDeComparacion] = senoidal(0, length(digitos{ii})/fm, fm, frecuenciaColumna(jj), 1, 0);

        for kk = 1 : length(senoidalDeComparacion)
            productoPunto = abs(dot(digitos{ii}, senoidalDeComparacion));

            if (productoPunto > maxProductoPuntoColumna(jj))
                maxProductoPuntoColumna(jj) = productoPunto;
            end
            
            senoidalDeComparacion = shift(senoidalDeComparacion, 1);
        end
    end

    indiceColumna = find(maxProductoPuntoColumna == max(maxProductoPuntoColumna));

    numeroDiscado(ii) = numeros(indiceFila, indiceColumna);
end

%numeroDiscado =
%
%   2   4   2   8   1   6   4

% Resultado real:
% 2 4 2 8 2 6 5
