function salida = convolucionCircular(x, h)

if (length(x) != length(h))
  error("Las secuencias x e h deben tener la misma longitud")
end

N = length(x);
salida = zeros(1, N);

for k = 1 : N
  for l = 1 : N
    salida(k) += h(l) * x(mod(N + k - l, N) + 1);
  end
end
  