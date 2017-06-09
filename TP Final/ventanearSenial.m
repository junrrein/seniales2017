function ventanas = ventanearSenial(dominio, anchoVentanaHz, fraccionSolapamiento)
    
anchoVentanaMuestras = find(dominio == anchoVentanaHz - dominio(1));

if isempty(anchoVentanaMuestras)
    error("Revisá esto cacho")
end

nMuestrasSolapadas = floor(anchoVentanaMuestras * fraccionSolapamiento);
corrimientoVentana = anchoVentanaMuestras - nMuestrasSolapadas;

% FIXME: ¿Qué se hace con el solapamiento?
nVentanas = floor((length(dominio) - anchoVentanaMuestras) / corrimientoVentana) + 2;
ventanas = zeros(nVentanas, 2);
baseVentana = 1;
limiteVentana = anchoVentanaMuestras + 1;

for ii = 1 : (nVentanas - 1)
    if (limiteVentana > length(dominio))
        ventanas = ventanas(1 : size(ventanas, 1) - 1, :);
        break;
    end
    
    ventanas(ii, 1) = baseVentana;
    ventanas(ii, 2) = limiteVentana;
    baseVentana += corrimientoVentana;
    limiteVentana += corrimientoVentana;
end

ventanas(end, 1) = length(dominio) - anchoVentanaMuestras;
ventanas(end, 2) = length(dominio);