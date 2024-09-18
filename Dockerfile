# Usar la imagen base de Ubuntu
FROM ubuntu:latest

# Actualizar los repositorios y paquetes
RUN apt-get update && apt-get upgrade -y

# Instalar PHP y sus dependencias
RUN apt-get install -y php php-cli php-mbstring

# Instalar paquetes adicionales necesarios para PHP
RUN apt-get install -y php-xml php-curl

# Instalar el servidor web y otros paquetes necesarios
RUN apt-get install -y curl unzip

# Establecer el directorio de trabajo en /var/www/html
WORKDIR /var/www/html

# Copiar el contenido de la carpeta webapp en el contenedor
COPY ./webapp /var/www/html

# Exponer el puerto 80 para acceder a la aplicación
EXPOSE 80

# Ejecutar el servidor PHP integrado
CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html"]
