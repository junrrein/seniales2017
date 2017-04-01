senial1 = zeros(1, 40);
senial1(1:10) = 1;
[~, senial2] = senoidal(0, 1, 40, 1, 1, 0);

%senial1 = [1 2 2];
%senial2 = [2 1 0.5];

convolucion1 = conv(senial1, senial2);
convolucion2 = filter(senial2, 1, [senial1 zeros(1, 40)]);
convolucion3 = sistemaLineal(1, senial2, senial1);

figure
subplot(3, 2, 1)
stem(senial1)
title("Señal de entrada x")
xlabel("Tiempo")
ylabel("Magnitud")
grid on

subplot(3, 2, 3)
stem(senial2)
title("Señal de entrada y")
xlabel("Tiempo")
ylabel("Magnitud")
grid on

subplot(3, 2, 2)
stem(convolucion1, 'r')
title("conv(x,y)")
xlabel("Tiempo")
ylabel("Magnitud")
grid on

subplot(3, 2, 4)
stem(convolucion2, 'r')
title("filter(y, 1, [x zeros(1, 40)])")
xlabel("Tiempo")
ylabel("Magnitud")
grid on

subplot(3, 2, 6)
stem(convolucion3, 'r')
title("sistemaLineal(1, y, x)")
xlabel("Tiempo")
ylabel("Magnitud")
grid on

setFontSize(12)