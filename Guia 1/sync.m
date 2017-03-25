function [t, y] = sync(tInicial, tFinal, fMuestreo, fSenial, amplitud)
% te la debo

    T = 1 / fMuestreo;
    t = tInicial : T : (tFinal - T);
    x = 2*pi*fSenial*t;
    y = zeros(length(x));
    tolerancia = 1e-6;
    for k=1:length(x)
      if abs(x(k))<tolerancia
        y(k) = amplitud;
      else  
        y(k) = amplitud*sin(x(k))/x(k);
      end
    end

end