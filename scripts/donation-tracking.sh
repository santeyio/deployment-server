#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd /var/opt/donation-tracking &> $DIR/log-donation-tracking.log;
source bin/activate &> $DIR/log-donation-tracking.log;
kill `cat tmp/gunicorn.pid` &> $DIR/log-donation-tracking.log;
rm -r donation-tracking &> $DIR/log-donation-tracking.log;
git clone https://github.com/santeyio/donation-tracking.git &> $DIR/log-donation-tracking.log;
cd donation-tracking &> $DIR/log-donation-tracking.log;
pip install -r requirements.txt &> $DIR/log-donation-tracking.log;
chmod 755 /var/opt/donation-tracking/donation-tracking &> $DIR/log-donation-tracking.log;
find /var/opt/donation-tracking/donation-tracking/static -type d -exec chmod 755 {} \ &> $DIR/log-donation-tracking.log;
find /var/opt/donation-tracking/donation-tracking/static -type f -exec chmod 644 {} \ &> $DIR/log-donation-tracking.log;
../bin/gunicorn -D --worker-class eventlet -w 1 --bind 127.0.0.1:5503 -p ../tmp/gunicorn.pid app:app &> $DIR/log-donation-tracking.log;

