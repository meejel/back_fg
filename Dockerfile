# Usa la imagen base de Python
FROM python:3.9

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo requirements.txt al directorio de trabajo
COPY requirements.txt /app/

# Instala los requerimientos del proyecto
RUN pip install --no-cache-dir -r requirements.txt

# Copia todos los archivos del directorio actual al directorio de trabajo del contenedor
COPY . /app/

# Ejecuta las migraciones de la base de datos
RUN python manage.py makemigrations
RUN python manage.py migrate

# Expone el puerto 8000 para que pueda ser accedido externamente
EXPOSE 8000

# Comando para ejecutar el servidor Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
