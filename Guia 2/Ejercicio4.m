% De entrada tenemos las 3 ecuaciones en diferencias
% Para introducirlas utilizamos los coeficientes a_i y b_i de la ecuación.

A1 = [1 0 -1];
B1 = [1];

A2 = [1];
B2 = [1 0.5];

A3 = [1 -0.5 0.25];
B3 = [1];

H1 = respuestaImpulso(A1, B1);
H2 = respuestaImpulso(A2, B2);
H3 = respuestaImpulso(A3, B3);

figure
subplot(3, 1, 1)
stem(H1)
title("Respuesta al impulso para la ecuacion 1")
xlabel("Muestra")
ylabel("Magnitud")

subplot(3, 1, 2)
stem(H2)
title("Respuesta al impulso para la ecuacion 2")
xlabel("Muestra")
ylabel("Magnitud")

subplot(3, 1, 3)
stem(H3)
title("Respuesta al impulso para la ecuacion 3")
xlabel("Muestra")
ylabel("Magnitud")
