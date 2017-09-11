#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd /var/opt/spotifyvisual;
source bin/activate &> $DIR/log-spotifyvisual.log;
kill `cat tmp/gunicorn.pid` &>> $DIR/log-spotifyvisual.log;
rm -r spotifyvisual &>> $DIR/log-spotifyvisual.log;
git clone https://github.com/santeyio/spotifyvisual.git &>> $DIR/log-spotifyvisual.log;
cp private.py spotifyvisual/spotifyvisual/private.py &>> $DIR/log-spotifyvisual.log;
cd spotifyvisual &>> $DIR/log-spotifyvisual.log;
pip install -r requirements.txt &>> $DIR/log-spotifyvisual.log;
python manage.py makemigrations &>> $DIR/log-spotifyvisual.log;
python manage.py migrate &>> $DIR/log-spotifyvisual.log;
python manage.py collectstatic &>> $DIR/log-spotifyvisual.log;
chmod 755 /var/opt/spotifyvisual/spotifyvisual &>> $DIR/log-spotifyvisual.log;
find /var/opt/spotifyvisual/spotifyvisual/site_media -type d -exec chmod 755 {} \ &>> $DIR/log-spotifyvisual.log;
find /var/opt/spotifyvisual/spotifyvisual/site_media -type f -exec chmod 644 {} \ &>> $DIR/log-spotifyvisual.log;
../bin/gunicorn -D --bind 127.0.0.1:5501 -p ../tmp/gunicorn.pid spotifyvisual.wsgi:application &>> $DIR/log-spotifyvisual.log;
