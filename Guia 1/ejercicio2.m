%senial senoidal 
amplitud = 1;
[t, ySenoidal] = senoidal(0,1,100,2,amplitud,0); 

%inversion
yInvertida = -ySenoidal;

%rectificacion onda completa
yRectificada = abs(ySenoidal);

%cuantizacion 8 niveles
N = 8;
H = amplitud*2/ (N-1);
yCuantizada = cuantizacion(ySenoidal, N, H);

%graficas
figure;
subplot(4,1,1)
stem(t,ySenoidal)
title("senial original")
xlabel("tiempo (segundos)")
ylabel("magnitud")

subplot(4,1,2)
stem(t,yInvertida)
title("senial Invertida")
xlabel("tiempo (segundos)")
ylabel("magnitud")

subplot(4,1,3)
stem(t,yRectificada)
title("senial Rectificada")
xlabel("tiempo (segundos)")
ylabel("magnitud")

subplot(4,1,4)
stem(t,yCuantizada)
title("senial Cuantizada")
xlabel("tiempo (segundos)")
ylabel("magnitud")
