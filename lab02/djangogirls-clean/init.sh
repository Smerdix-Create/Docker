#! /bin/sh

# User credentials
#user=admin
#email=admin@example.com
#password=pass
#file=db/db.sqlite3

#!/bin/sh

if [ ! -f "db/db.sqlite3" ]; then
    echo "База данных не найдена..."
    python3 manage.py migrate --noinput
    python3 manage.py shell <<EOF
from django.contrib.auth.models import User

if not User.objects.filter(username='$user').exists():
    User.objects.create_superuser('$user', '$email', '$password')
    print('Суперпользователь создан.')
else:
    print('Суперпользователь уже существует.')
EOF
else
    echo "База данных найдена. Проверка наличия суперпользователя..."
    python3 manage.py shell <<EOF
from django.contrib.auth.models import User

if not User.objects.filter(username='$user').exists():
    User.objects.create_superuser('$user', '$email', '$password')
    print('Суперпользователь создан.')
else:
    print('Суперпользователь уже существует.')
EOF
fi
