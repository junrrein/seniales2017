clear

seniales = {};
[~, seniales{1}] = senoidal(0, 1, 100, 2, 1, 0);
seniales{2} = seniales{1} * 2;
[~, seniales{3}] = senoidal(0, 1, 100, 3, 1, 0);
[~, seniales{4}] = senoidal(0, 1, 100, 3, 1, pi/3);
[~, seniales{5}] = senoidal(0, 1, 100, 2, 1, pi/3);
[~, seniales{6}] = senoidal(0, 1, 100, 2, 1, pi);
t = 0 : length(seniales{1}) - 1;

productoInterno = zeros(1, length(seniales) - 1);
for ii = 1 : length(seniales)
  productoInterno(ii) = dot(seniales{1}, seniales{ii});
end

descripciones = {"Señal 1: seno de 2 Hz",
  "Señal 2: Seno de 2 Hz y amplitud 2",
  "Señal 3: Seno de 3 Hz",
  "Señal 3: Seno de 3 Hz y fase pi/3",
  "Señal 4: Seno de 2 Hz y fase pi/3",
  "Senal 5: Seno de 2 Hz y fase pi"};

figure
for ii = 1 : length(seniales)
  subplot(3, 1, 1)
  plot(seniales{1})
  title(descripciones{1})
  xlabel("Tiempo")
  ylabel("Magnitud")
  grid on
  
  subplot(3, 1, 2)
  plot(seniales{ii})
  title(descripciones(ii))
  xlabel("Tiempo")
  ylabel("Magnitud")
  grid on
  
  subplot(3, 1, 3)
  area(t, seniales{1} .* seniales{ii})
  title(cstrcat("Producto interno entre las señales = ", num2str(productoInterno(ii))))
  xlabel("Tiempo")
  ylabel("Magnitud")
  grid on
  
  setFontSize(12)
  
  input("")
end

close all
