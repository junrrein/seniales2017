function salida = sistemaLineal (A, B, entrada)
% Entradas:
% A : Coeficientes a_k del sistema lineal
% B : Coeficientes b_k del sistema lineal
% entrada : entrada del sistema
% Se asume que el sistema es causal.
% ======================================
% Salidas:
% salida: Salida del sistema a la entrada dada

% Se inicializa el vector de salida
salida = zeros(1, length(entrada) + length(B) - 1);

% Evaluar la salida para cada instante de tiempo
M = length(B);
N = length(A);

for n = 1 : length(salida);
    % Iteramos sobre los coeficientes b
    for kk = 1 : M
        if (n - kk + 1 > 0 && n - kk + 1 <= length(entrada))
            % Notar que se divide por a0
            salida(n) += B(kk) * entrada(n - kk + 1) / A(1);
        end
    end
    
    % Iteramos sobre los coeficientes a
    for kk = 2 : N
        if (n - kk + 1 > 0)
            % Notar que se divide por a0
            salida(n) += A(kk) * salida(n - kk + 1) / A(1);
        end
    end
end
