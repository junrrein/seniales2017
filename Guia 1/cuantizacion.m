function yCuantizada = cuantizacion(x, N , H)
% ENTRADA
% x : señal de entrada
% N : numero de niveles de cuantizacion
% H : magnitud del cuanto o paso

minX = min(x);
senialPositiva = x - minX;

for k=1 : length(senialPositiva)
  if senialPositiva(k) >= 0 && senialPositiva(k) < (N-1)*H,
    senialPositiva(k) = H*round(senialPositiva(k)/H);
  else  % if x >= N*H 
    senialPositiva(k) = (N-1)*H;
  end
 
 end

 yCuantizada = senialPositiva + minX;

end