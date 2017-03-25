% Ejercicio 1

% Entrada: 
% funcion escalon.
impulso = zeros(1, 30);
impulso(1:5) = 1;
y1 = zeros(1, 30);

% Sistema 1
A = 2;
T = 1/100;
omega = 8*pi;
for n=1 : length(impulso)
  y1(n) = impulso(n)*A*sin(omega*n*T);
end

figure
subplot(2,2,1)
stem(y1)

% Sistema 2

n0 = 3;
y2 = zeros(1, 30);
for n=1 : 30
  if n-n0 < 1
    limiteInferior = 1;
  else
    limiteInferior = n-n0;
  end
  
  if n+n0 > 30
    limiteSuperior = 30;
  else
    limiteSuperior = n+n0;
  end
  
  for kk=limiteInferior : limiteSuperior
    y2(n) += impulso(kk);
  end
 end

 subplot(2,2,2)
stem(y2)


% Sistema 3

y3 = zeros(1, 30);
for n=1 : length(impulso)
  y3(n) = impulso(n) + 2;
end

subplot(2,2,3)
stem(y3)
 
 
 
% Sistema 4

y4 = zeros(1, 30);
for n=1 : length(impulso)
  y4(n) = n*impulso(n);
end

subplot(2,2,4)
stem(y4)

 