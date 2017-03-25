function salida = sistemaLineal (A, B, entrada)
% te la debo

salida = zeros(1, length(entrada));

% Evaluar la salida para cada instante de tiempo
for ii = 1 : length(salida);
    % Iteramos sobre los coeficientes b
    for jj = 1 : length(B)
        if (ii - jj + 1 > 0)
            % Notar que se divide por a0
            salida(ii) += B(jj) * entrada(ii - jj + 1) / A(1);
        end
    end
    
    % Iteramos sobre los coeficientes a
    for kk = 2 : length(A)
        if (ii - kk + 1 > 0)
            % Notar que se divide por a0
            salida(ii) += A(kk) * salida(ii - kk + 1) / A(1);
        end
    end
end