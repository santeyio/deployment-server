#!/bin/bash

cd /var/opt/spotifyvisual;
source bin/activate;
kill `cat tmp/gunicorn.pid`;
rm -r spotifyvisual;
git clone https://github.com/santeyio/spotifyvisual.git;
cp db_settings.py spotifyvisual/spotifyvisual/db_settings.py
cd spotifyvisual;
pip install -r requirements.txt;
python manage.py makemigrations;
python manage.py migrate;
python manage.py collectstatic;
chmod 755 /var/opt/spotifyvisual/spotifyvisual;
find /var/opt/spotifyvisual/spotifyvisual/static -type d -exec chmod 755 {} \;
find /var/opt/spotifyvisual/spotifyvisual/static -type f -exec chmod 644 {} \;
../bin/gunicorn -D --bind 127.0.0.1:5501 -p ../tmp/gunicorn.pid spotifyvisual.wsgi:application;
