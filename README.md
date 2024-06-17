# 🛜 Reaktor NetworkWeb
Este proyecto nace como proyecto integrado del alumno Alejandro Cazalla Pérez para desarrollar una interfaz gráfica a **Reaktor NetworkServer**.
Tiene como objetivo escanear las redes disponibles e intentar encontrar todos los equipos asociados a ella.

> Esta web dispone de todo lo necesario para facilitar al usuario la información de los equipos conectados a una red, teniendo una página de inicio donde podemos hacer búsquedas mediante filtros para que sea más fácil encontrar la información que queremos.

> Esta información se podrá extraer a CSV a través de un botón. También hay un login para que no entre cualquiera, los usuarios que pueden entrar están guardados en un JSON el ual se podrá modificar.

> También hay una página de borrado de información, la cual permite borrar mediante varias opciones a elegir para que los datos no se vayan quedando obsoletos en la base de datos.

# ❗ REQUISITOS ❗
Este proyecto depende de **Reaktor NetworkServer**, que se basa en ☕Java 17 y aunque luego será capaz de scanear todo tipo de equipos, solamente se puede ejecutar en 💻windows 10.

### 📇 REQUISITOS PRE-INSTALACIÓN 📇
Se requiere tener MySQL instalado.

Este proyecto utiliza la herramienta nmap , y hace uso interno de comandos como:
```bash
nmap -sn <ip>
```
⚠️Por lo tanto, es totalmente necesario instalar primero esta herramienta.⚠️

Crear la base de datos network_server vacía en MySQL, para que pueda arrancar el proyecto correctamente.

También es necesario tener Ruby on Rails instalado, ya que esta web esta hecha a partir de este framework.

# ⚙️ INSTALACIÓN ⚙️
Tras estos pasos solo es necesario tener instalado el proyecto y compilarlo. 
Siempre asegurándose de que esté correctamente la configuración del application.yml, ya que en el MySQL de su equipo, puede variar la contraseña y el usuario, por lo que deberá cambiar estos parámetros en el apartado de username y password del archivo de configuración. 
Y para arrancar la web, en la carpeta donde tenemos guardado el proyecto, escribir en consola: 
```bash 
rails s
```
Aunque antes de lanzar la web, estaría bien hacer un: 
```bash 
bundle install
```
para que se instalen todas las gemas necesarias.

Para cargar los usuarios del JSON para el login y añadir más, solo hay que modificar este JSON, meter el usuairo deseado y tras esto escribir en consola el siguiente comando:
```bash 
Rake import:users
```

Esto hará que se carguen todos los usuarios del JSON.

# 🔌 ENDPOINTS 🔌
Se han creado estos endpoints para facilitar la informnación al usuario:

### 📗 GET
Filtra la red y encuentra equipos segun lo que se le pase en el filtro.
```bash
http://localhost:8080/net/red/by/search
```
![image](https://github.com/IESJandula/Reaktor_NetworkWeb/assets/126677320/abfa43e4-6fc3-41d6-b717-5bb3ff7c2d12)


### 📗 POST
Borra la información de todas las redes según los días que se pasen a través del combobox.
```bash
http://localhost:8080/net/red/deleteAllBefore
```
![image](https://github.com/IESJandula/Reaktor_NetworkWeb/assets/126677320/fc39c3e5-cd16-4510-8d2f-e58c96fcc2a6)


# ☎️ CONTACTO 
Aquí facilito medios para poder contactar a través de mi LinkedIn: https://www.linkedin.com/in/alejandro-cazalla-p%C3%A9rez-0765a6272/

También dejo el enlace a mi Github: https://github.com/aaleexcaazaallaa

Gracias por su atención.
