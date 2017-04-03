clear

for ii = 1 : 10
  [~, senoidales{ii}] = senoidal(0, 1, 200, ii, 1, 0);
  senoidales{ii} /= norm(senoidales{ii});
end

alphas = [1 2 0.5 -1 -0.2 4 2 -3.5 7.2 1];

senial1 = zeros(1, length(senoidales{1}));
for ii = 1 : length(senoidales)
  senial1 += senoidales{ii} * alphas(ii);
end

coeficientes1 = zeros(1, length(senoidales));
for ii = 1 : length(coeficientes1)
  coeficientes1(ii) = dot(senial1, senoidales{ii});
end

figure
subplot(2, 2, 1)
plot(senial1)
title("Señal analizada 1")
xlabel("Muestras")
ylabel("Magnitud")
grid on

subplot(2, 2, 3)
bar(coeficientes1)
title("Producto punto de la señal con las distintas senoidales componente")
xlabel("Frefuencia")
ylabel("Magnitud")
grid on



% Calcular grado de parecido entre una señal con las componentes desfasadas y
% las senoidales generadas inicialmente.
senial2 = zeros(1, length(senoidales{1}));
for ii = 1 : length(senoidales)
  [~, aux] = senoidal(0, 1, 200, ii, 1, rand(1,1)*2*pi);
  senial2 += aux / norm(aux);
end

coeficientes2 = zeros(1, length(senoidales));
for ii = 1 : length(coeficientes2)
  coeficientes2(ii) = dot(senial2, senoidales{ii});
end

subplot(2, 2, 2)
plot(senial2)
title("Señal analizada 2 (componentes desfazadas aleatoriamente)")
xlabel("Muestras")
ylabel("Magnitud")
grid on

subplot(2, 2, 4)
bar(coeficientes2)
title("Producto punto de la señal con las distintas senoidales componente")
xlabel("Frefuencia")
ylabel("Magnitud")
grid on


setFontSize(12)