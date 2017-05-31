function result = energiaBanda(dominio, espectro)
  
limInferior = find(dominio >= 320)(1);
limSuperior = find(dominio >= 460)(1);
result(1) = sum(espectro(limInferior : limSuperior));

limInferior = find(dominio >= 4800)(1);
limSuperior = find(dominio >= 5200)(1);
result(2) = sum(espectro(limInferior : limSuperior));

limInferior = find(dominio >= 7400)(1);
limSuperior = find(dominio >= 7600)(1);
result(3) = sum(espectro(limInferior : limSuperior));
