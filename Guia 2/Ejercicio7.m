% Calcular las respuestas al impulso de los dos sistemas
N = 50;
hA = sin(8 * (1 : N));
a = 0.8;
hB = a .^ (1:N);

% Determinar la salida para una entrada determinada
x = [1 -a zeros(1, 40)];

% Probando con los sistemas conectados en distinto orden

% Probando x -> hA -> hB -> y
convIntermedia1 = conv(x, hA);
salida1 = conv(convIntermedia1, hB);

figure(1)
subplot(3, 2, 1)
stem(x)
title("Entrada")
grid on

subplot(3, 2, 3)
stem(hA)
title("hA")
grid on

subplot(3, 2, 5)
stem(convIntermedia1)
title("Salida intermedia")
grid on

subplot(3, 2, 2)
stem(convIntermedia1)
title("Salida intermedia")
grid on

subplot(3, 2, 4)
stem(hB)
title("hB")
grid on

subplot(3, 2, 6)
stem(salida1)
title("Salida final")
grid on

% Probando x -> hB -> hA -> y
convIntermedia2 = conv(x, hB);
salida2 = conv(convIntermedia2, hA);

figure(2)
subplot(3, 2, 1)
stem(x)
title("Entrada")
grid on

subplot(3, 2, 3)
stem(hB)
title("hB")
grid on

subplot(3, 2, 5)
stem(convIntermedia2)
title("Salida intermedia")
grid on

subplot(3, 2, 2)
stem(convIntermedia2)
title("Salida intermedia")
grid on

subplot(3, 2, 4)
stem(hA)
title("hA")
grid on

subplot(3, 2, 6)
stem(salida2)
title("Salida final")
grid on
