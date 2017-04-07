1. ¿Cómo se puede interpretar que las señales digitales de N muestras son puntos en un espacio R^N?

    Las señales digitales de N muestras se pueden representar como puntos en un espacio R^N si se utilizan los valores de magnitud tomados en las N muestras como las N componentes de un punto en un espacio R^N.

2. ¿Por qué decimos que las señales continuas son puntos en el espacio R^Inf?

    Se dice que las señales continuas son puntos en el espacio R^Inf porque, desde el punto de vista de las señales discretas, existen infinitas muestras en un intervalo dado, y para representar estas muestras se necesitaría un vector con infinitas componentes, que solo existen en el espacio R^Inf.

3. ¿Cuáles son las ventajas de poder ver a las señales como puntos en un espacio R^N?

    La venta de poder ver a las señales como puntos o vectores en un espacio R^N, es que se pueden aprovechar muchas herramientas del álgebra lineal ideadas con vectores en mente para el análisis de las señales.
También permite un abordaje del procesamiento de señales más sencillo e intuitivo, ya que de esta manera se pueden interpretar las señales desde una perspectiva geométrica.

4. ¿Para qué sirven las normas? ¿Por qué hay distintas normas?

    Las normas sirven para definir alguna medida útil del tamaño de las señales. Existen distintas normas porque la medida que da cada una es útil en situaciones distintas a las demás.

5. ¿Cómo se puede definir una norma-p para P=0? ¿Qué utilidad tendría una norma como ésta?

    Para P=0, muchos matemáticos e ingenieros definen la norma-cero como el número de elementos del vector distintos de cero.  
    Esto tiene utilidad, por ejemplo, en problemas lineales subdeterminados, que tienen muchas soluciones, donde el objetivo es encontrar la solución que tenga la mayor cantidad de elementos nulos, ya que vectores "ralos" (con gran cantidad de elementos nulos) pueden ser almacenados en memoria de manera más eficiente. En estos problemas, el objetivo sería encontrar la solución que tiene norma-cero mínima.  
    En procesamiento de señales, esto tiene utilidad ya que permite reconstruir señales utilizando menor cantidad de muestras que las requeridas por el teorema de Nyquist.

6. ¿Cómo puede interpretarse gráficamente la norma p=Inf?

    Utilizada como distancia en R^2, en un tablero de ajedrez, la norma p=Inf es el mínimo número de movimientos que un rey necesita para navegar entre dos cuadrados del tablero.

7. ¿Cuál es la relación que existe entre las normas p y las medidas físicas de acción, energía, potencia, raíz del valor cuadrático medio y amplitud?

    - La acción es igual a la norma-1.
    - La energía es igual al cuadrado de la norma-2.
    - La amplitud es igual a la norma-infinito.
    - La raíz del valor cuadrático medio está relacionada con la energía de la señal, que a su vez está relacionada con la norma-2.

8. ¿Cómo se relacionan las definiciones de normas y producto interno en el caso de las señales discretas y las continuas? ¿Cuál es el equivalente discreto del $dt$ que aparece en el caso de señales continuas?

    En el caso de las señales discretas y continuas, la relación entre normas y producto interno es que el producto interno de una señal consigo misma es igual al cuadrado de su norma-2.
    TODO El equivalente discreto del dt que aparece en el caso de señales continuas está dado por el período de muestreo de la señal discreta.

9. ¿En qué casos es necesario utilizar el conjugado en la definición del producto interno?

    Es necesario utilizar el conjugado en la definición del producto interno cuando se trabaja con valores pertenecientes al conjunto de los números complejos.

10. ¿Por qué decimos que el producto interno mide el parecido entre dos señales? Analícelo primero para señales en R^2 y luego extienda el análisis a señales continuas.

    TODO

11. ¿Cuál es la relación entre producto interno y proyección?

    La proyección de un vector a en otro vector b se mide como el múltiplo entre el módulo de a y el coseno del ángulo entre los vectores.  
    Otra forma de calcular el producto interno entre dichos vectores es mediante el múltiplo entre el   módulo de a, el módulo de b y el coseno del ángulo entre los vectores.  
    Puede verse que ambos cálculos son muy similares. Para obtener la proyección a partir del producto interno, solo es necesario dividir el producto interno entre los vectores por la norma de b.

12. ¿Qué diferencia hay entre conjunto y espacio de señales?

    Un espacio de señales es un conjunto de señales al que se le ha asociado una métrica particular.

13. Un mismo conjunto de señales con dos métricas diferentes, ¿conforman dos espacios de señales diferentes?

    En efecto, la métrica utilizada forma parte de la identidad de un espacio de señales.

14. ¿Qué utilidad tiene definir un espacio vectorial en el análisis de señales?

    La utilidad de definir un espacio vectorial en el análisis de señales es que trabajar con espacios vectoriales aporta muchas propiedades y herramientas que facilitan el trabajo con señales.

15. ¿Cómo se verifican las propiedades de cerradura en un espacio vectorial?

    Las propiedades de cerradura de un espacio vectorial se verifican planteando un par de vectores y escalares genéricos pertenecientes al espacio vectorial y verificando si la suma y la multiplicación por un escalar de estos elementos genéricos sigue perteneciendo al espacio vectorial.  
    Alternativamente, se puede mostrar que las operaciones no son cerradas utilizando un contraejemplo.  

16. ¿Qué ventajas tiene el hecho de que una base sea ortonormal?

    La ventaja que tiene utilizar una base ortonormal radica en que un cambio de la base canónica a una base de este tipo puede verse geométricamente como una rotación del sistema de los ejes coordenados, manteniendo la escala y proporciones.

17. ¿Puede una base estar formada por señales linealmente dependientes? ¿Y por señales no ortogonales?

    Independencia lineal: No. Los vectores de una base tienen que ser linealmente independientes por definición.
    Ortogonalidad: Los vectores de una base vectorial no necesitan ser ortogonales entre sí, mientras satisfagan la condición de independencia lineal. Además, puede que se esté trabajando en un espacio vectorial que no posee la operación de producto interno, por lo que la ortogonalidad no entra en juego en ese caso.  

18. Demostrar que las proyecciones ortogonales minimizan el criterio del error cuadrático en la aproximación de señales.

    Ver página 59 del libro.

19. ¿Por qué decimos que un cambio de base es un caso particular de transformación lineal?

    Un cambio de base es una transformación lineal porque realiza una correspondencia entre elementos de dos espacios vectoriales cumpliendo la propiedad de linealidad.
    Es un caso particular de transformación lineal porque los espacios vectoriales mapeados son los mismos.

20. ¿Bajo qué condiciones se puede asegurar que un cambio de base es simplemente una rotación de las señales de la base canónica?

    Se puede asegurar que un cambio de base es simplemente una rotación de las señales de la base canónica cuando la base es ortonormal, es decir, cuando los vectores de la base son ortogonales entre sí, y cuando dichos vectores tienen norma 1.

21. ¿Cómo se puede interpretar geométricamente el teorema de Parseval a partir de considerar a una transformación con base ortonormal como un simple cambio de base? ¿Qué sucede si la base es simplemente ortogonal?

    El teorema de Parseval establece que la energía de una señal permanece invariante ante cambios de base con bases ortonormales.
    Interpretando geométricamente las señales como vectores, la energía es igual a la norma-2 del vector o la longitud del mismo. Cuando este es vector es transformado linealmente, su longitud no cambiará solo si la transformación es una rotación, como lo es el caso de las transformaciones con bases ortonormales. Si la base es solamente ortogonal, el vector sufrirá deformaciones o cambios de escala, por lo que su longitud (y por lo tanto, su energía) cambiarán debido al cambio de base. TODO ¿Puede salvarse esta diferencia tan solo redefiniendo la forma en que se calcula la energía en cada base?

22. Exprese la transformación lineal de una señal discreta y su correspondiente transformación inversa mediante productos matriciales.

    Ver página 67 del libro.

23. Indique cómo se aplica en esta transformación la idea de parecido entre señales y su medida a través del producto interno.

    La proyección de un vector en otro da una idea del parecido entre los mismos. El producto interno entre dichos vectores es proporcional a la proyección anterior.
    Al realizar un cambio de base, para calcular cada coeficiente se hace el producto interno entre el vector a transformar y los vectores de la base correspondientes. Por lo tanto, cada coeficiente del vector transformado da una medida del grado de parecido del vector con los vectores de la base utilizada.

24. Escriba las ecuaciones y dé ejemplos de una base para transformaciones lineales en las que:

    a) La señal en el dominio original y la señal transformada son discretas.  
        El ejemplo está dado como una transformación lineal en $\mathbb{R}^2$, donde la base de la transformación es:  
        $$
        f(n) =
        \begin{cases}
        [0 \; 1]   \\
        [-1 0]
        \end{cases}
        $$
        La ecuación de la transformación lineal es:
        $$
        x_{B}[n] = <x[n], B^n> = \sum_{i=0}^1 x[i] \, B^n[i]
        $$

b) La señal en el dominio original es continua y la señal transformada discreta.

    TODO CONSULTAR

c) La señal en el dominio original es discreta y la señal transformada continua.

d) La señal en el dominio original y la señal transformada son continuas.

25. En cada uno de los casos anteriores indique en qué espacio (R^?) están las señales de la base y en qué espacio (R^(?x?)) está la matriz de la transformación.

26. Muestre con un ejemplo sencillo que para las transformaciones lineales en las que los vectores de la base son ortonormales, la matriz de inversión es la transpuesta de la matriz de transformación.

    TODO. ¿Ejemplo con rotación en 2D?
