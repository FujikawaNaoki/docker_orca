#!/bin/bash

/etc/init.d/postgresql restart

TIMEOUT=50
until sudo -u orca psql -l > /dev/null 2>&1 || [ $TIMEOUT -eq 0 ]; do
  echo "Waiting for postgres server, $((TIMEOUT--)) remaining attempts..."
  sleep 5
done

/etc/init.d/jma-receipt restart

echo "All Start OK!!"

/bin/bash --login
