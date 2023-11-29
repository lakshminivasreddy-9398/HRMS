#!/bin/sh

ssh root@3.91.151.238 <<EOF
cd python
git pull 
source /opt/envs/python/bin/activate
pip insall requirements.txt
.manag.py makemigrations
./manage.py migrate --run-syncdb
sudo service gunicorn restart
sudo service nginx restart
exit
EOF