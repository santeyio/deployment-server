#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd /var/opt/calebhayashida &> $DIR/log-calebhayashida.log;
source bin/activate &> $DIR/log-calebhayashida.log;
kill `cat tmp/gunicorn.pid` &> $DIR/log-calebhayashida.log;
rm -r calebhayashida &> $DIR/log-calebhayashida.log;
git clone https://github.com/santeyio/calebhayashida.git &> $DIR/log-calebhayashida.log;
cd calebhayashida &> $DIR/log-calebhayashida.log;
pip install -r requirements.txt &> $DIR/log-calebhayashida.log;
chmod 755 /var/opt/calebhayashida/calebhayashida &> $DIR/log-calebhayashida.log;
find /var/opt/calebhayashida/calebhayashida/static -type d -exec chmod 755 {} \ &> $DIR/log-calebhayashida.log;
find /var/opt/calebhayashida/calebhayashida/static -type f -exec chmod 644 {} \ &> $DIR/log-calebhayashida.log;
../bin/gunicorn -D --bind 127.0.0.1:5502 -p ../tmp/gunicorn.pid app:app &> $DIR/log-calebhayashida.log;

