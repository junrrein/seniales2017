clear

[yBaja, fm] = audioread("grabaciones/cantidadBaja.wav");
yMedia = audioread("grabaciones/cantidadMedia.wav");
yAlta = audioread("grabaciones/cantidadMayor.wav");

nMuestras = 2 * fm;

yBaja = yBaja(460_000 : 460_000 + nMuestras - 1);
yMedia = yMedia(540_000 : 540_000  + nMuestras - 1);
yAlta = yAlta(330_000 : 330_000  + nMuestras - 1);

subplot(3,1,1);
[dominioAlta, espectroAlta] = plotFFT(yAlta, fm, @plot);
title("Tasa de caida de agua alta");
grid on;
aux = xlim;
xlim([0 aux(end) ]);
ylim([0 0.0005]);

subplot(3,1,2);
[dominioMedia, espectroMedia] = plotFFT(yMedia, fm, @plot);
title("Tasa de caida de agua media");
grid on;
aux = xlim;
xlim([0 aux(end) ]);
ylim([0 0.0005]);

subplot(3,1,3);
[dominioBaja, espectroBaja] = plotFFT(yBaja, fm, @plot);
title("Tasa de caida de agua baja");
grid on;
aux = xlim;
xlim([0 aux(end) ]);
ylim([0 0.0005]);

energiaBandaAlta = energiaBanda(dominioAlta, espectroAlta);
cocientesAlta = energiaBandaAlta ./ shift(energiaBandaAlta, -1)

energiaBandaMedia = energiaBanda(dominioMedia, espectroMedia);
cocientesMedia = energiaBandaMedia ./ shift(energiaBandaMedia, -1)

energiaBandaBaja = energiaBanda(dominioBaja, espectroBaja);
cocientesBaja = energiaBandaBaja ./ shift(energiaBandaBaja, -1)