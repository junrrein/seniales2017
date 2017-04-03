% generar varias señales usando randn para q tenga media cero y varianza 1

y = single(randn(10000));

limite1 = 1000;
limite2 = 4000;
limite3 = 7000;

% Si queremos chequear que un tipo de señal sea estacionaria
% Necesitamos verificar si la distribucion de los valores posibles que la señal
% toma a traves de todas las realizaciones en un momento dado sea la misma que
% esa distribucion para cualquier otro instante de tiempo.
% Como no nos da el cuero para verificar formalmente a que distribucion conforman
% los valores que toma una variable, nos conformamos con verificar que la media
% y la varianza de esas distribuciones sea la misma.
% Idealmente, es necesario realizar esta comprobacion para todas las realizaciones
% posibles de la señal.
% En el mundo real, esto no es posible.
% Lo que se puede hacer es tomar un conjunto reducido de realizaciones (muestra), estimar
% los valores de la media y la varianza, y luego realizar el mismo analisis tomando
% una mayor cantidad de realizaciones, y verificando que las estimaciones de
% la media y la varianza vayan mejorando. Es decir, que la varianza de la media
% muestral y la varianza de la varianza muestral vayan disminuyendo, idealmente
% hasta anularse.
% Esta comprobado que, si el valor que puede tomar la senial a traves de todas
% las realizaciones en realidad corresponde a la misma distribucion para distintos
% instantes de tiempo, la precision de nuestros estimadores va a aumentar.



% checkear estacionariedad
% calcular la media a traves de distintas realizacione, tomando cada vez mas
% realizaciones.
% Si el valor de la media no difiere en mucho a medida que se toman mas realizaciones,
% y la varianza de la media
% disminuye (idealmente hasta anularse), puede decirse que a traves de todas
% las realizaciones se tiene el valor promedio que puede tomar la variable
% en un instante de tiempo determinado a traves de distintas realizaciones.
% Idem para la varianza.
% Teniendo confianza de que los valores de media y varianza obtenidos se
% corresponden con los de la poblacion,
% decimos que la señal es estacionaria.

% ---------------------------------------------------------------------

disp("-----------------------------")
disp("Estacionariedad")
disp("-----------------------------")

disp("--------------------------")
disp("Media de la media muestral")
disp("--------------------------")

medias1 = mean(y(1:limite1, :));
medias2 = mean(y(1:limite2, :));
medias3 = mean(y(1:limite3, :));

disp("la media de la medias a traves de 1000 realizaciones es: ");
mean(medias1)
disp("la varianza de la medias a traves de 1000 realizaciones es: ");
var(medias1)

disp("la varianza de la medias a traves de 4000 realizaciones es: ");
var(medias2)

disp("la varianza de la medias a traves de 7000 realizaciones es: ");
var(medias3)

mediasEntreRealizaciones = mean(y);


disp("la media de las medias entre todas las realizaciones es: ");
mean(mediasEntreRealizaciones)
disp("la varianza de las medias entre todas las realizaciones es: ");
var(mediasEntreRealizaciones)

% ---------------------------------------------------------------------

disp("-----------------------------")
disp("Varianza de la media muestral")
disp("-----------------------------")

varianzas1 = var(y(1:limite1, :));
varianzas2 = var(y(1:limite2, :));
varianzas3 = var(y(1:limite3, :));

disp("la media de la varianzas a traves de 1000 realizaciones es: ");
mean(varianzas1)
disp("la varianza de la varianzas a traves de 1000 realizaciones es: ");
var(varianzas1)

disp("la varianza de la varianzas a traves de 4000 realizaciones es: ");
var(varianzas2)

disp("la varianza de la varianzas a traves de 7000 realizaciones es: ");
var(varianzas3)

varianzasEntreRealizaciones = var(y);

disp("la media de las varianzas entre todas las realizaciones es: ");
mean(varianzasEntreRealizaciones)
disp("la varianza de las varianzas entre todas las realizaciones es: ");
var(varianzasEntreRealizaciones)

% ---------------------------------------------------------------------

% checkear ergodicidad
%

disp("-----------------------------")
disp("Ergodicidad")
disp("-----------------------------")

medias = mean(y, 2); % Media calculada a lo largo de cada fila

disp("la media de las medias de las realizaciones es: ");
mean(medias)
disp("la varianza de las medias de las realizaciones es: ");
var(medias)

% ---------------------------------------------------------------------

varianzas = var(y, 0, 2); % Varianza calculada a lo largo de cada fila

disp("la media de las varianzas de las realizaciones es: ");
mean(varianzas)
disp("la varianza de las varianzas de las realizaciones: ");
var(varianzas)
