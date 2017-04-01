function [t, y] = cuadrada(tInicial, tFinal, fMuestreo, fSenial, amplitud, angFase)
% te la debo

    T = 1 / fMuestreo;
    t = tInicial : T : (tFinal - T);
    y = zeros(1,length(t));
  
    for k=1:length(t)
      if mod(2*pi*fSenial*t(k), 2*pi) >= pi 
        y(k) = -amplitud;
      else  
        y(k) = amplitud;
      end
    end

end