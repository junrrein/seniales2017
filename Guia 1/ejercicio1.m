%senial senoidal 

[tSenoidal1, ySenoidal1] = senoidal(0,1,100,10,3,0); 
[tSenoidal2, ySenoidal2] = senoidal(0,1,100,2,1,pi);
[tSenoidal3, ySenoidal3] = senoidal(0,1,100,20,3,pi/3);

figure;
subplot(3,3,1);
stem(tSenoidal1, ySenoidal1);
title("senoidal1");
xlabel("tiempo (segundos)");
ylabel("magnitud");

subplot(3,3,4);
stem(tSenoidal2, ySenoidal2);
title("senoidal2");
xlabel("tiempo (segundos)");
ylabel("magnitud");

subplot(3,3,7);
stem(tSenoidal3, ySenoidal3);
title("senoidal3");
xlabel("tiempo (segundos)");
ylabel("magnitud");

% senial sync
[tSync1, ySync1] = sync(0,1,100,10,3); 
[tSync2, ySync2] = sync(0,1,100,2,1);
[tSync3, ySync3] = sync(0,1,100,20,3);


subplot(3,3,2);
stem(tSync1, ySync1);
title("sync1");
xlabel("tiempo (segundos)");
ylabel("magnitud");

subplot(3,3,5);
stem(tSync2, ySync2);
title("sync2");
xlabel("tiempo (segundos)");
ylabel("magnitud");

subplot(3,3,8);
stem(tSync3, ySync3);
title("sync3");
xlabel("tiempo (segundos)");
ylabel("magnitud");

% senial cuadrada
[tCuadrada1, yCuadrada1] = cuadrada(0,1,100,10,3); 
[tCuadrada2, yCuadrada2] = cuadrada(0,1,100,2,1);
[tCuadrada3, yCuadrada3] = cuadrada(0,1,100,20,3);


subplot(3,3,3);
stem(tCuadrada1, yCuadrada1);
title("cuadrada1");
xlabel("tiempo (segundos)");
ylabel("magnitud");

subplot(3,3,6);
stem(tCuadrada2, yCuadrada2);
title("cuadrada2");
xlabel("tiempo (segundos)");
ylabel("magnitud");

subplot(3,3,9);
stem(tCuadrada3, yCuadrada3);
title("cuadrada3");
xlabel("tiempo (segundos)");
ylabel("magnitud");
