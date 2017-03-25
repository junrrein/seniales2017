fSenoidal = 5;
tInicial = 0;
tFinal = 1;

[t100, ySenoidal100] = senoidal(tInicial, tFinal, 100, fSenoidal, 1, 0);
[t25, ySenoidal25] = senoidal(tInicial, tFinal, 25, fSenoidal, 1, 0);
[t10, ySenoidal10] = senoidal(tInicial, tFinal, 10, fSenoidal, 1, 0);
[t4, ySenoidal4] = senoidal(tInicial, tFinal, 4, fSenoidal, 1, 0);
[t1, ySenoidal1] = senoidal(tInicial, tFinal, 1, fSenoidal, 1, 0);
[t0dot5, ySenoidal0dot5] = senoidal(tInicial, tFinal, 0.5, fSenoidal, 1, 0);

subplot(3, 2, 1)
stem(t100, ySenoidal100)
title("Senoidal 5 Hz - Fm = 100 Hz")
xlabel("Tiempo (segundos)")
ylabel("Magnitud")

subplot(3, 2, 2)
stem(t25, ySenoidal25)
title("Senoidal 5 Hz - Fm = 25 Hz")
xlabel("Tiempo (segundos)")
ylabel("Magnitud")

subplot(3, 2, 3)
stem(t10, ySenoidal10)
title("Senoidal 5 Hz - Fm = 10 Hz")
xlabel("Tiempo (segundos)")
ylabel("Magnitud")

subplot(3, 2, 4)
stem(t4, ySenoidal4)
title("Senoidal 5 Hz - Fm = 4 Hz")
xlabel("Tiempo (segundos)")
ylabel("Magnitud")

subplot(3, 2, 5)
stem(t1, ySenoidal1)
title("Senoidal 5 Hz - Fm = 1 Hz")
xlabel("Tiempo (segundos)")
ylabel("Magnitud")

subplot(3, 2, 6)
stem(t0dot5, ySenoidal0dot5)
title("Senoidal 5 Hz - Fm = 0,5 Hz")
xlabel("Tiempo (segundos)")
ylabel("Magnitud")
