% Ejercicio 1

% Entrada: 
% funcion escalon.
impulso = zeros(1, 12);
impulso(1:5) = 1;

figure
subplot(3, 2, 1:2)
stem(impulso)
title("Señal de entrada")
xlabel("Tiempo")
ylabel("Magnitud")
grid on

% Sistema 1
y1 = zeros(1, length(impulso));
A = 2;
T = 1/100;
omega = 8*pi;
for n=1 : length(impulso)
  y1(n) = impulso(n)*A*sin(omega*n*T);
end

subplot(3,2,3)
stem(y1)
title("Salida del sistema 1")
xlabel("Tiempo")
ylabel("Magnitud")
grid on

% Sistema 2
n0 = 3;
y2 = zeros(1, length(impulso));
for n=1 : length(y2)
  if n-n0 < 1
    limiteInferior = 1;
  else
    limiteInferior = n-n0;
  end
  
  if n+n0 > length(y2)
    limiteSuperior = length(y2);
  else
    limiteSuperior = n+n0;
  end
  
  for kk=limiteInferior : limiteSuperior
    y2(n) += impulso(kk);
  end
end

subplot(3,2,4)
stem(y2)
title("Salida del sistema 2")
xlabel("Tiempo")
ylabel("Magnitud")
grid on

% Sistema 3
y3 = zeros(1, length(impulso));
for n = 1 : length(y3)
  y3(n) = impulso(n) + 2;
end

subplot(3,2,5)
stem(y3)
title("Salida del sistema 3")
xlabel("Tiempo")
ylabel("Magnitud")
grid on

% Sistema 4
y4 = zeros(1, length(impulso));
for n = 1 : length(y4)
  y4(n) = n*impulso(n);
end

subplot(3,2,6)
stem(y4)
title("Salida del sistema 4")
xlabel("Tiempo")
ylabel("Magnitud")
grid on

setFontSize(12)
