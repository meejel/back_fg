# Usa la imagen base de Python
FROM python:3.9

# Directorio de trabajo en el contenedor
WORKDIR /app

# Copia los archivos de requerimientos y luego instala las dependencias
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto de los archivos al directorio de trabajo
COPY . /app/

# Comando para crear la base de datos y realizar migraciones
# RUN python manage.py makemigrations
# RUN python manage.py migrate

# Comando para correr el servidor
CMD ["python", "manage.py", "runserver"]
