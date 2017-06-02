function result = cocientesEntreBandas(dominio, espectro)
  
limInferior = find(dominio >= 100)(1);
limSuperior = find(dominio >= 170)(1);
banda(1) = sum(espectro(limInferior : limSuperior));

limInferior = find(dominio >= 170)(1);
limSuperior = find(dominio >= 230)(1);
banda(2) = sum(espectro(limInferior : limSuperior));

limInferior = find(dominio >= 550)(1);
limSuperior = find(dominio >= 650)(1);
banda(3) = sum(espectro(limInferior : limSuperior));

limInferior = find(dominio >= 900)(1);
limSuperior = find(dominio >= 1025)(1);
banda(4) = sum(espectro(limInferior : limSuperior));

result = zeros(length(banda));

for ii = 1 : length(banda)
  result(ii, ii:end) = banda(ii) ./ banda(ii:end);
end
