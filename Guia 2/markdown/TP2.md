## Convolución

### Ejercicio 3

![](enunciado7.png)

![](cascada.png)

#### Resultado del sistema $(x[n] * h_A) * h_B$:

![](hAhB.png)

#### Resultado del sistema $(x[n] * h_B) * h_A$:

![](hBhA.png)

Como puede verse, la salida de los sistemas es igual.  
Esto sucede porque los dos sistemas son lineales e invariantes en el tiempo.  
Bajo estas condiciones, la convolución de varias secuencias es conmutativa, es decir, el orden en que pase la señal de entrada por los sistemas intermedios es indistinto.