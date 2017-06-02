clear

[yBaja, fm] = audioread("grabaciones/Clip7.wav");
yMedia = audioread("grabaciones/Clip8.wav");

yBaja = yBaja(200_000 : 300_000);
yMedia = yMedia(150_000 : 250_000);

subplot(2,1,1);
[dominioMedia, espectroMedia] = plotFFT(yMedia, fm, @plot);
title("Tasa de caida de agua media");
grid on;
limiteAbcisa = find(dominioMedia >= 1500)(1);
xlim([0 dominioMedia(limiteAbcisa) ]);
ylim([0 max(espectroMedia)]);

subplot(2,1,2);
[dominioBaja, espectroBaja] = plotFFT(yBaja, fm, @plot);
title("Tasa de caida de agua baja");
grid on;
xlim([0 dominioMedia(limiteAbcisa) ]);
ylim([0 max(espectroMedia)]);

cocientesMedia = cocientesEntreBandas(dominioMedia, espectroMedia)
cocientesBaja = cocientesEntreBandas(dominioBaja, espectroBaja)