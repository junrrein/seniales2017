[tSenoidal1, ySenoidal1] = senoidal(0,1,100,10,3,0); 
[tSenoidal2, ySenoidal2] = senoidal(0,1,100,2,1,pi);
[tSenoidal3, ySenoidal3] = senoidal(0,1,100,20,3,pi/3);

figure;
subplot(3,3,1);
plot(tSenoidal1, ySenoidal1);
title("senoidal1");
xlabel("tiempo (segundos)");
ylabel("magnitud");

subplot(3,3,4);
plot(tSenoidal2, ySenoidal2);
title("senoidal2");
xlabel("tiempo (segundos)");
ylabel("magnitud");

subplot(3,3,7);
plot(tSenoidal3, ySenoidal3);
title("senoidal3");
xlabel("tiempo (segundos)");
ylabel("magnitud");
