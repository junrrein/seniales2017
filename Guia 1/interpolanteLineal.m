function y = interpolanteLineal (x)

if (abs(x) < 1)
  y = 1 - abs(x);
else
  y = 0;
end