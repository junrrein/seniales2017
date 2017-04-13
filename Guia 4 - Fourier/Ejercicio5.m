[~, senial] = senoidal(0, 1, 50, 27, 1, 0);

plotFFT(senial, 50)
%stem(0:49, abs(fft(senial)))
title("TDF de una senoidal de 27 Hz muestreada a 50 Hz")
setFontSize(12)
