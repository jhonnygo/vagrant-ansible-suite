<img src="img/header.jpg?raw=true" alt="Header Logo" width="100%" />

# :star: Quick reference
* **Maintained by**: Jhoncy Tech - JhonnyGO

---
## :sparkler: <u>Descripción</u>
El siguiente repositorio se ha realizado con fines educativos, tiene como objetivo facilitar un entorno de pruebas para realizar practicas utilizando Ansible, donde desde una maquina central o **(ansible-srv)**, podemos controlar las maquinas que esten registradas en nuestro inventario de ansible.

Para lograr esto se ha creado un box que levanta un conjunto de cinco maquinas virtuales:

* vm1 - Servidor de Ansible **(ansible-srv)**
* vm2 - Servidor controlado 1 **(ansible-01)**
* vm3 - Servidor controlado 2 **(ansible-02)**
* vm4 - Servidor controlado 3 **(ansible-03)**
* vm5 - Servidor controlado 4 **(ansible-04)**

<div align="left">
    <img src="img/virtualbox.jpg?raw=true" alt="Virtualbox" width="500px" />
</div>

Lo anterior nos permitira realizar pruebas de control utilizando Ansible.

---
### :sparkler: <u>Entorno del box</u>
La siguiente imagen muestra el entorno del box:

<div align="center">
    <img src="img/grafico.jpg?raw=true" alt="Grafico del entorno" width="400px" />
</div>

---
### :sparkler: <u>Como usar el box</u>
Partimos de que debe tener instalado en su PC local Virtualbox y Vagrant en ese mismo orden.

Si no esta instalado deberá realizar las instalaciones adecuadas:

[Descarga e instalación de Virtualbox](https://www.virtualbox.org/wiki/Downloads)
<br/>
[Descarga e instalación de Vagrant](https://developer.hashicorp.com/vagrant/install?product_intent=vagrant)

---
#### <u>Procedimiento en Windows</u>
Accedemos a la carpeta de nuestro PC local donde
deseemos mantener el proyecto y Clonamos el repositorio
~~~
cd C:\mi-proyecto
git clone git@github.com:jhonnygo/vagrant-ansible-suite.git ansible
~~~

Accedemos a la carpeta ansible
~~~
cd ansible
~~~

Procedemos a levantar la infraestructura
~~~
vagrant up
~~~

⏰ Tendremos que esperar un par de minutos a que se desplieguen las maquinas virtuales, un total de 5.

Comandos importantes
Si queremos apagar las maquinas y mantener la información guardada en los discos extras.
~~~
vagrant halt
~~~

Si queremos destruir ambas maquinas de forma permanente.
~~~
vagrant destroy
~~~

<div style="background-color: #ffe6e6; padding: 10px; border: 1px solid #f00;">
  <strong style="color: #f00;">¡Advertencia!</strong> Una vez destruidas las maquinas virtuales la información no se puede recuperar.
</div>

<br/>

---

# <u>Accesos importantes</u>

Una vez desplegadas las maquinas virtuales, estos seran los accesos:

Ansible:
Servidor de Ansible

#### Acceso SSH Mediante Vagrant
Desde este acceso SSH podemos controlar al resto de maquinas.
~~~
vagrant ssh vm1
~~~

---

#### Acceso SSH desde cualquier terminal local
Desde este acceso SSH podemos controlar al resto de maquinas.
Cuando solicite la contraseña: 123456
~~~
ssh -p 2222 vagrant@localhost
~~~

---

#### Acceso Mediante Putty
Desde este acceso SSH podemos controlar al resto de maquinas.
Cuando solicite la contraseña: 123456

<div align="left">
    <img src="img/putty-01.jpg?raw=true" alt="Acceso Putty 01" width="300px" />
</div>

<div align="left">
    <img src="img/putty-02.jpg?raw=true" alt="Acceso Putty 02" width="600px" />
</div>

---

### :sparkler: <u>Ejemplo de operación en una maquina controlada</u>
Supongamos que queremos crear un archivo desde el servidor Ansible a la VM2 o ansible-01.

Accedemos a la maquina controladora o ansible-srv
~~~
vagrant ssh vm1
~~~

Creamos un archivo en la vm2 o ansible-01
~~~
ansible ansible-01 -m copy -b -a 'content="Ansible Managed\n" dest=/var/mi-archivo.txt'
~~~

Ahora accedemos a la vm2 o ansible-01 para comprobar
~~~
vagrant ssh vm2
~~~

Comprobamos que se creara el archivo mi-archivo.txt y su contenido
~~~
ls -la /var
cat /var/mi-archivo.txt
~~~

<div align="left">
    <img src="img/ansible-test-2.jpg?raw=true" alt="Ansible Test 2" width="500px" />
</div>

---

## Contacts
    - Mail: contacto@jhonnygo.com
    - Web: https://jhonnygo.com
    ---
    - Mail: jhonny@jhoncytech.com
    - Web: https://jhoncytech.com


<img src="img/happy-coding.jpg?raw=true" alt="Footer Logo" />
