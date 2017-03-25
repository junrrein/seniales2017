[t, y] = senoidal(0, 2, 129, 4000, 1, 0);

figure
stem(t, y)
title("Senoidal de 4000 Hz, muestreada a 129 Hz")
xlabel("Tiempo (segundos)")
ylabel("Magnitud")