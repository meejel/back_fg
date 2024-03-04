from django.contrib.auth.models import User
from django.db import migrations

def create_superuser(apps, schema_editor):
    User.objects.create_superuser(
        username='admin',
        password='admin',
        email='framework.meejel@gmail.com'
       
    )

class Migration(migrations.Migration):

    dependencies = [
        ('meejel', '0001_initial'),
    ]

    operations = [
        migrations.RunPython(create_superuser),
    ]