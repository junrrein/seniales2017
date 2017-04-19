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
    for k = 1 : M
        % Se hacen dos chequeos de indices:
        % El primero chequea que no estemos intentando acceder a un valor
        % de la entrada antes de t = 0.
        % El segundo chequea que no se este intentando acceder a un valor de
        % la entrada despues que esta termino. Notar que este chequeo no hace
        % falta al iterar sobre los coeficientes a. Ver con un ejemplo.
        if (n - k + 1 > 0 && n - k + 1 <= length(entrada))
            % Notar que se divide por a0
            salida(n) += B(k) * entrada(n - k + 1) / A(1);
        end
    end
    
    % Iteramos sobre los coeficientes a
    for k = 2 : N
        if (n - k + 1 > 0)
            % Notar que se divide por a0
            salida(n) -= A(k) * salida(n - k + 1) / A(1);
        end
    end
end
