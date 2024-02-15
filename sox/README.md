# SOX
================   ZONA DE TRABAJO SOX   ================== 

* [Scripts]
* [Comandos]

### 1.1.Lista todas las reglas o cadenas introducidas en el cortafuegos
<code>$sudo iptables -L </code>


### 1.2.Borra todas las reglas introducidas en el cortafuegos.
<code>$sudo iptables -F</code>



### 1.3.Añade una regla para eliminar todos los paquetes de salida (es decir, que desde tu ordenador no pueda salir ningún paquete).  Comprueba después que no tienes acceso a Internet.
<code>$sudo iptables -A OUTPUT -j DROP</code>

### 1.4.Elimina la regla introducida anteriormente y comprueba que de nuevo tienes acceso a Internet.
<code>$sudo iptables -L –line-number
 $sudo iptables -D INPUT 1</code>

### 1.5.Añade una regla para no dejar pasar ningún paquete de entrada. Comprueba en este caso que tampoco tienes conexión a Internet.
<code>$sudo iptables -A INPUT -j DROP</code>



### 1.6.Borra la regla introducida en el apartado 5.
<code>$sudo iptables -D INPUT -j DROP</code>




### 1.7.Añade una regla para dejar pasar todos los paquetes que salgan de tu ordenador.
<code>$sudo iptables -A OUTPUT -s 192.168.100.10 -j ACCEPT</code>





### 1.8.Tenemos un servidor web instalado y queremos permitir el acceso desde el exterior. Añade la regla necesaria al cortafuegos.
<code>$sudo iptables -A INPUT -p tcp –dport 80 -j ACCEPT</code>




### 1.9.Tenemos un servidor ftp funcionando y queremos permitir el acceso ftp desde el exterior. Añade la regla necesaria en IPTABLES.
<code>$sudo iptables -A INPUT -i eth0 -p tcp –dport 21 -j ACCEPT
$sudo iptables -A INPUT -i eth0 -p tcp –dport 20 -j ACCEPT</code>





### 1.10.Si quieres denegar el acceso por debajo del puerto 1024. ¿Qué reglas debes añadir a IPTABLES?
<code>$sudo iptables -A INPUT -p tcp –dport 0:1023 -j DROP</code>



### 1.11.Rechaza todos los paquetes que vengan de la dirección 80.100.30.27
<code>$sudo iptables -A INPUT -p tcp -s 80.100.30.27 -j DROP</code>




### 1.12.Borra todas las reglas introducidas y añade una para que no se pueda hacer ping a nuestro equipo
<code>$sudo iptables -F
$sudo iptables -A INPUT –d 192.168.100.10 -p icmp -j DROP</code>

### 1.13.Añade una regla para dejar pasar todos los paquetes que procedan de 127.0.0.1 (loopback) y vayan dirigidos al equipo 80.90.1.150
<code>$sudo iptables -A INPUT -s 127.0.0.1 -d 80.90.1.150 -j ACCEPT</code>



### 1.14.No queremos permitir que el equipo con ip 80.90.100.110 se pueda conectar a nuestro servidor web. Añadir una regla para denegar el acceso al servidor web a ese equipo
<code>$sudo iptables -A INPUT -s 80.90.100.110 -p tcp -dport 80 -j DROP</code>


### 1.15.Añade una regla para permitir el acceso vía ssh (puerto 22) al equipo con ip 90.80.70.60
<code>$sudo iptables -A OUTPUT -d 90.80.70.60 -p tcp -dport 22 -j ACCEPT</code>


### 1.16.Añade una regla cuya función sea hacer ping desde nuestra propia máquina (protocolo icmp).
<code>$sudo iptables -A OUTPUT -s 192.168.100.10 -p icmp -j ACCEPT</code>


### 1.17.Añade una regla para que el ordenador que tienes situado a tu derecha no obtenga respuesta al hacer ping.
<code>$sudo iptables -t filter -A INPUT -d 192.168.100.10 -s 192.168.100.11 -p icmp –icmp-type echoreplay -j DROP</code>



### 1.18.Añade una regla para impedir conectarse mediante FTP al ordenador con IP 192.168.1.15. EJERCICIO
<code>$sudo iptables -A INPUT -d 192.168.1.15 -p tcp –dport 21 -j DROP
$sudo iptables -A INPUT -d 192.168.1.15 -p tcp –dport 20 -j DROP</code>



* Cuando se pida que no deje realizar algo, siempre es mejor utilizar un DROP en lugar de un REJECT, ya que el primero no da información al no permitir realizar la acción, mientras que el REJECT rechaza y da información a la persona que ha intentado realizar la acción y por tanto podrían encontrar alguna vulnerabilidad
