clear

fm = 200;
t = -1 : 1/fm : (1 - 1/fm);

% Funcion original
funcion = ones(1, length(t));
funcion(t < 0) = -1;

% Aproximacion utilizando los primeros 4 polinomios de Legendre
aproxLegendre4Coef = 45/16 * t - 35/16 * t.^3;
errorCuadraticoAprox1 = sum((funcion - aproxLegendre4Coef).^2);

% Error a medida que varia la magnitud de los coeficientes en la aproximacion
% anterior
delta = 0.5;
paso = 0.01;
alpha1 = 1.2247 - delta : paso : 1.2247 + delta;
alpha3 = -0.46771 - delta : paso : -0.46771 + delta;

errores = (zeros(length(alpha1), length(alpha3)));

for ii = 1 : length(alpha1)
  for jj = 1 : length(alpha3)
    aproximacion = alpha1(ii) * sqrt(3/2) * t + alpha3(jj) * sqrt(7/2) * (5/2 * t.^3 - 3/2 * t);
    errores(ii, jj) = sum((funcion - aproximacion).^2);
  end
end

[XX, YY] = meshgrid(alpha1, alpha3);
figure
surface(XX, YY, errores);
title("Error en la aproximacion con polinomios de legendre")
xlabel("alpha_1")
ylabel("alpha_3")
zlabel("Error cuadratico total")
view(3)
grid on

% Aproximacion con los primeros 8 polinomios de Legendre
aproxLegendre8Coef = -15.71044921874994*t.^7+30.79248046874989*t.^5-19.73876953124994*t.^3+5.38330078124999*t;
errorCuadraticoAprox2 = sum((funcion - aproxLegendre8Coef).^2);

disp("Error en la aproximacion con 4 polinomios de Legendre:")
disp(errorCuadraticoAprox1)
disp("Error en la aproximacion con 8 polinomios de Legendre:")
disp(errorCuadraticoAprox2)
