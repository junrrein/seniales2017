senial1 = zeros(1, 40);
senial1(1:10) = 1;
senial2 = senoidal(0, 1, 40, 1, 1, 0);

%senial1 = [1 2 2];
%senial2 = [2 1 0.5];

convolucion1 = conv(senial1, senial2);
convolucion2 = filter(senial2, 1, [senial1 zeros(1, 40)]);
convolucion3 = sistemaLineal(1, senial2, senial1);

figure
subplot(3, 1, 1)
stem(convolucion1)
grid on

subplot(3, 1, 2)
stem(convolucion2)
grid on

subplot(3, 1, 3)
stem(convolucion3)
grid on
