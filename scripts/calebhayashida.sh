#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd /var/www;
rm -r calebhayashida &>> $DIR/log-calebhayashida.log;
git clone https://github.com/santeyio/calebhayashida.git &>> $DIR/log-calebhayashida.log;
