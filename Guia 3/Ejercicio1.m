[~, senialSenoidal] = senoidal(0,1,100,2,1,0);
[~, senialCuadrada] = cuadrada(0,1,100,2,1,0);
senialAleatoria = rand(1,100)-0.5;
senialRampa = cumsum(ones(1,100))-1;

%valor medio
medioSenoidal = valorMedio(senialSenoidal);
medioCuadrada = valorMedio(senialCuadrada);
medioAleatoria = valorMedio(senialAleatoria);
medioRampa = valorMedio(senialRampa);

disp(" valor medio")
disp("====================")
disp(cstrcat("senoidal: " ,num2str(medioSenoidal)) )
disp(cstrcat("cuadrada: " , num2str(medioCuadrada) ))
disp(cstrcat("aleatoria: " , num2str(medioAleatoria)) )
disp(cstrcat("rampa: " , num2str(medioRampa)) )

disp("\n maximo")
disp("====================")
disp(cstrcat("senoidal: " ,num2str(max(senialSenoidal))) )
disp(cstrcat("cuadrada: " , num2str(max(senialCuadrada)) ))
disp(cstrcat("aleatoria: " , num2str(max(senialAleatoria))) )
disp(cstrcat("rampa: " , num2str(max(senialRampa))) )

disp("\n minimo")
disp("====================")
disp(cstrcat("senoidal: " ,num2str(min(senialSenoidal))) )
disp(cstrcat("cuadrada: " , num2str(min(senialCuadrada)) ))
disp(cstrcat("aleatoria: " , num2str(min(senialAleatoria))) )
disp(cstrcat("rampa: " , num2str(min(senialRampa))) )

disp("\n amplitud")
disp("====================")
disp(cstrcat("senoidal: " ,num2str(max(abs(senialSenoidal)))) )
disp(cstrcat("cuadrada: " , num2str((max(abs(senialCuadrada)) ))))
disp(cstrcat("aleatoria: " , num2str((max(abs(senialAleatoria)) ))))
disp(cstrcat("rampa: " , num2str((max(abs(senialRampa)) ))))

disp("\n energia")
disp("====================")
disp(cstrcat("senoidal: " ,num2str(sum(senialSenoidal.^2)))) 
disp(cstrcat("cuadrada: " , num2str((sum(senialCuadrada.^2)) )))
disp(cstrcat("aleatoria: " , num2str((sum(senialAleatoria.^2)) )))
disp(cstrcat("rampa: " , num2str((sum(senialRampa.^2)) )))

disp("\n accion")
disp("====================")
disp(cstrcat("senoidal: " ,num2str(sum(abs(senialSenoidal)))) )
disp(cstrcat("cuadrada: " , num2str((sum(abs(senialCuadrada)) ))))
disp(cstrcat("aleatoria: " , num2str((sum(abs(senialAleatoria)) ))))
disp(cstrcat("rampa: " , num2str((sum(abs(senialRampa)) ))))


disp("\n potencia media")
disp("====================")
disp(cstrcat("senoidal: " ,num2str(sum(senialSenoidal.^2)/length(senialSenoidal) ))) 
disp(cstrcat("cuadrada: " , num2str(sum(senialCuadrada.^2)/length(senialCuadrada) )))
disp(cstrcat("aleatoria: " , num2str(sum(senialAleatoria.^2)/length(senialAleatoria) )))
disp(cstrcat("rampa: " , num2str(sum(senialRampa.^2)/length(senialRampa) )))

% queda hacer la item 8.