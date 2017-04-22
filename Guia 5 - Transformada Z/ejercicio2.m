z1 = @(z) 1 - 0.5*z.^(-1) + 0.25*z.^(-2);
A1 = 1;
B1 = [1 -0.5 0.25];

z2 = @(z) z.^(-1) ./ (1 - z.^(-1) - z.^(-2) );
A2 = [1 -1 -1];
B2 = [0 1];

z3 = @(z) 7 ./ (1 - 2*z.^(-1) + 6*z.^(-2) );
A3 = [1 -2 6];
B3 = [7];

function result = z4 (z)
  result = 0;
  for k=0 : 7
    result += 2^(-k)*z.^(-k);
  end  
end

A4 = 1;
B4 = 2.^(-(0:7));


N = 100;
k = 0 : N-1;

subplot(4,2,1)
respFrec1 = z1(exp(j*2*pi*k/N));
stem(abs(respFrec1))   
title("magnitud H1(k)-calculado a partir de  H(z)")
xlabel("frecuencia")
ylabel("magnitud")

subplot(4,2,2)
respuestaImpulso1 = respuestaImpulso(A1,B1,N-2);
stem(abs(fft(respuestaImpulso1)))    
title("magnitud H1(k)-calculado a partir de  h(n)")
xlabel("frecuencia")
ylabel("magnitud")

subplot(4,2,3)
respFrec2 = z2(exp(j*2*pi*k/N));
stem(abs(respFrec2))   
title("magnitud H2(k)-calculado a partir de  H(z)")
xlabel("frecuencia")
ylabel("magnitud")

subplot(4,2,4)
respuestaImpulso2 = respuestaImpulso(A2,B2,N-1);
respuestaImpulso2 /= norm(respuestaImpulso2 );
stem(abs(fft(respuestaImpulso2)))    
title("magnitud H2(k)-calculado a partir de  h(n)")
xlabel("frecuencia")
ylabel("magnitud")

subplot(4,2,5)
respFrec3 = z3(exp(j*2*pi*k/N));
stem(abs(respFrec3))   
title("magnitud H3(k)-calculado a partir de  H(z)")
xlabel("frecuencia")
ylabel("magnitud")

subplot(4,2,6)
respuestaImpulso3 = respuestaImpulso(A3,B3,N);
respuestaImpulso3 /= norm(respuestaImpulso3 );
stem(abs(fft(respuestaImpulso3)))    
title("magnitud H1(k)-calculado a partir de  h(n)")
xlabel("frecuencia")
ylabel("magnitud")


subplot(4,2,7)
respFrec4 = z4(exp(j*2*pi*k/N));
stem(abs(respFrec4))   
title("magnitud H4(k)-calculado a partir de  H(z)")
xlabel("frecuencia")
ylabel("magnitud")

subplot(4,2,8)
respuestaImpulso4 = respuestaImpulso(A4,B4,N-7);
stem(abs(fft(respuestaImpulso4)))    
title("magnitud H4(k)-calculado a partir de  h(n)")
xlabel("frecuencia")
ylabel("magnitud")

