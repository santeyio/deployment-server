#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd /var/opt/mmb/mmbfront &> $DIR/log-mmb-build.log;
git pull origin master &>> $DIR/log-mmb-build.log;
npm run build &>> $DIR/log-mmb-build.log;
cp -r dist/* ../mmbback/static &>> $DIR/log-mmb-build.log;
cd /var/opt/mmb;
source bin/activate &>> $DIR/log-mmb-build.log;
cd mmbback;
git pull origin master &>> $DIR/log-mmb-build.log;
./restart &>> $DIR/log-mmb-build.log;

#chmod 755 /var/opt/donation-tracking/donation-tracking &> $DIR/log-mmb-build.log;
#find /var/opt/donation-tracking/donation-tracking/static -type d -exec chmod 755 {} \ &> $DIR/log-mmb-build.log;
#find /var/opt/donation-tracking/donation-tracking/static -type f -exec chmod 644 {} \ &> $DIR/log-mmb-build.log;

#kill `cat tmp/gunicorn.pid` &> $DIR/log-mmb-build.log;
#rm -r donation-tracking &> $DIR/log-mmb-build.log;
#cd donation-tracking &> $DIR/log-mmb-build.log;
#pip install -r requirements.txt &> $DIR/log-mmb-build.log;
#../bin/gunicorn -D --worker-class eventlet -w 1 --bind 127.0.0.1:5503 -p ../tmp/gunicorn.pid app:app; 
