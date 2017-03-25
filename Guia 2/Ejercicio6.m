senial1 = zeros(1, 40);
senial1(1:10) = 1;
[~, senial2] = senoidal(0, 1, 40, 1, 1, 0);

%senial1 = [2 1 0.5];
%senial2 = [1 2 2];

convoLineal = sistemaLineal(1, senial1, senial2);
convoCircular = convolucionCircular(senial1, senial2);

figure
subplot(2, 2, 1)
stem(senial1)
title("Senial 1")
grid on

subplot(2, 2, 2)
stem(senial2)
title("Senial 2")
grid on

subplot(2, 2, 3)
stem(convoLineal)
title("Convolucion lineal")
grid on

subplot(2, 2, 4)
stem(convoCircular)
title("Convolucion circular")
grid on

