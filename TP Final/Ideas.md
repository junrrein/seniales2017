# Ideas para el TP Final

## Estimar la precipitación a partir del ruido que hace la lluvia en una superficie

La precipitación genera un sonido al caer en una superfice (como una chapa o una lámina de plástico) que para los seres humanos es característico. Intuitivamente podemos discernir una lluvia suave de un chaparrón a partir de la intensidad del sonido que se genera y de la frecuencia con la que caen las gotas.

La idea es analizar la señal de sonido producida y, a partir de la misma, aproximar la cantidad de lluvia caída (en mm/h, por ejemplo).

Una simplificación del problema sería reemplazar el fenómeno natural por un experimento controlado, utilizando una botella con tapa agujereada. Como caso de control se tomaría la medida en un pluviómetro, y luego se grabaría el sonido que hace el mismo caudal de agua en un trozo de chapa o plástico, trabajando luego con esta señal de sonido.

## Sensor de proximidad mediante ecolocación

Existen varias situaciones en las que es útil conocer la distancia entre objetos. A un automóvil que está estacionando le es útil conocer la distancia a cualquier posible obstrucción ubicada por delante y por detrás. A un teléfono celular le es útil saber cuándo el usuario se acerca el aparato al oído en una llamada, para desactivar la pantalla táctil y evitar acciones accidentales.

La idea es obtener la distancia que hay desde un punto en el espacio hasta cualquier obstrucción, utilizando ecolocación. Se emite una señal de sonido, la cual rebota en los objetos cercanos. Detectando el eco puede calcularse la distancia que el sonido ha recorrido.

Una versión simplificada del problema es tratar de calcular la distancia a un único objeto desde el mismo punto en el espacio, acercando y alejando el objeto para trabajar con distintas distancias.

## Estimar la altura de una persona a partir de la señal de voz

Es posible utilizar la señal de voz generada por una persona para estimar varías características de dicha persona. Algunas, como la altura, sorprenden que puedan ser derivadas a partir de un fenómeno con el cual aparentemente no tienen conexión.

Existen características frecuenciales de la voz humana que están correlacionadas con la longitud de la tráquea, la cual a su vez está correlacionada con la altura de una persona.

La idea del trabajo es analizar señales de voz para estimar estas características frecuenciales y, a partir de ellas, realizar una estimación de la altura persona a la cual pertenece la señal de voz.

## Evaluar el desempeño de alguna técnica de cancelación de ruido para sonido

El ruido, siendo cualquier fenómeno que perturba la interpretación o análisis de una señal, es una característica molesta, y resulta de interés poder reducirlo o eliminarlo de la señal de interés.

Existen algunas aplicaciones en las que es deseable realizar esta operación en tiempo real. Muchos teléfonos celulares disponen de algún mecanismo para reducir el ruido ambiente al relizar una llamada. Existen auriculares que utilizan técnicas de cancelación de ruido para mejorar la experiencia del usuario.

La idea del trabajo sería explorar alguna de las técnicas de cancelación de ruido y evaluar su desempeño bajo distintas situaciones, como ruido de distinto tipo (baja/alta frecuencia) e intensidad.