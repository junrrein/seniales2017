# Sistemas

# Ejercicio 1

![](ejer1enunciado1.png)

* Causal: Si
* Lineal:
    * Homogéneo: Si.
    * Superposición: Si PREGUNTAR
* Invariante en el tiempo: No por la componente senoidal.
* Memoria: No posee.

![](ejer1enunciado2.png)

* Causal: No.
* Lineal:
    * Homogéneo: Si.
    * Superposición: Si.
* Invariante en el tiempo: Si.
* Memoria: Posee.

![](ejer1enunciado3.png)

* Causal: Si
* Lineal:
    * Homogéneo: No.
    * Superposición: No
* Invariante en el tiempo: Si
* Memoria: No posee.

![](ejer1enunciado4.png)

* Causal: Si
* Lineal:
    * Homogéneo: Si.
    * Superposición: Si
* Invariante en el tiempo: No
* Memoria: No posee.

### Salida de los sistemas para una entrada escalón unitario

![](ejer1grafico.png)

# Convolución

## Ejercicio 3

![](enunciado7.png)

![](cascada.png)

### Resultado del sistema $(x[n] * h_A) * h_B$:

![](hAhB.png)

### Resultado del sistema $(x[n] * h_B) * h_A$:

![](hBhA.png)

Como puede verse, la salida de los sistemas es igual.  
Esto sucede porque los dos sistemas son lineales e invariantes en el tiempo.  
Bajo estas condiciones, la convolución de varias secuencias es conmutativa, es decir, el orden en que pase la señal de entrada por los sistemas intermedios es indistinto.