#!/bin/bash

TARS="tarsAdminRegistry tarsregistry tarsnotify tarsconfig tarsnode tarslog tarspatch tarsproperty tarsqueryproperty tarsquerystat  tarsstat"

cd /usr/local/app/tars

for var in ${TARS};
do
  if [ -d ${var} ]; then
    echo "start ${var}"
    /usr/local/app/tars/${var}/util/start.sh
    sleep 1
  fi
done

if [ -d /usr/local/app/web ]; then
  # pm2 stop -s tars-node-web; cd /usr/local/app/web/; npm run prd;

  # pm2 stop -s tars-node-web; cd /usr/local/app/web/; sudo yarn run prd;
    pm2 stop -s tars-node-web; cd /usr/local/app/web/; sudo yarn run start;
fi

if [ -f /usr/local/app/web/demo/package.json ]; then
  pm2 stop -s tars-user-system; cd /usr/local/app/web/demo; npm run prd;
fi


