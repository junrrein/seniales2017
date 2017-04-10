clear

[~, senoidal2] = senoidal(0, 1, 100, 2, 1, 0);
[~, cuadrada2] = cuadrada(0, 1, 100, 2, 1, 0);
[~, senoidal4] = senoidal(0, 1, 100, 4, 1, 0);

% Punto 1
% Señales a y b
if (abs(dot(senoidal2, cuadrada2)) < 1e-6)
    disp("Las señales 'a' y 'b' son ortogonales")
else
    disp("Las señales 'a' y 'b' no son ortogonales")
end

% Señales a y c
if (abs(dot(senoidal2, senoidal4)) < 1e-6)
    disp("Las señales 'a' y 'c' son ortogonales")
else
    disp("Las señales 'a' y 'c' no son ortogonales")
end

% Señales b y c
if (abs(dot(cuadrada2, senoidal4)) < 1e-6)
    disp("Las señales 'b' y 'c' son ortogonales")
else
    disp("Las señales 'b' y 'c' no son ortogonales")
end

% Punto 2
senoidal2TDF = fft(senoidal2);
cuadrada2TDF = fft(cuadrada2);
senoidal4TDF = fft(senoidal4);

% Señales a y b
if (abs(dot(senoidal2TDF, cuadrada2TDF)) < 1e-6)
    disp("Las señales 'a' y 'b' son ortogonales en Fourier")
else
    disp("Las señales 'a' y 'b' no son ortogonales en Fourier")
end

% Señales a y c
if (abs(dot(senoidal2TDF, senoidal4TDF)) < 1e-6)
    disp("Las señales 'a' y 'c' son ortogonales en Fourier")
else
    disp("Las señales 'a' y 'c' no son ortogonales en Fourier")
end

% Señales b y c
if (abs(dot(cuadrada2TDF, senoidal4TDF)) < 1e-6)
    disp("Las señales 'b' y 'c' son ortogonales en Fourier")
else
    disp("Las señales 'b' y 'c' no son ortogonales en Fourier")
end

% Punto 3
[~, senoidal3coma5] = senoidal(0, 1, 100, 3.5, 1, 0);
senoidal3coma5TDF = fft(senoidal3coma5);

% Señales a y 3coma5
if (abs(dot(senoidal2, senoidal3coma5)) < 1e-6)
    disp("Las señales 'a' y '3coma5' son ortogonales")
else
    disp("Las señales 'a' y '3coma5' no son ortogonales")
end

% Señales a y 3coma5 en Fourier
if (abs(dot(senoidal2TDF, senoidal3coma5TDF)) < 1e-6)
    disp("Las señales 'a' y '3coma5' son ortogonales en Fourier")
else
    disp("Las señales 'a' y '3coma5' no son ortogonales en Fourier")
end
