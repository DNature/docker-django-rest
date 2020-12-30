#!/bin/bash

read -p "Enter command: " OPT

if [ "$OPT" = 'test' ] || [ "$OPT" = 't' ]
then
  echo "Running test suits ------- $OPT"
  exec docker-compose run --rm app sh -c 'python manage.py test && flake8';
elif [ "$OPT" = 'migrations' ] || [ "$OPT" = 'ms' ]
then
  echo "Creating Migrations ------- $OPT"
  exec docker-compose run --rm app sh -c 'python manage.py makemigrations';
elif [ "$OPT" = 'migrate' ] || [ "$OPT" = 'm' ]
then
  echo "Migrating ------- $OPT"
  docker-compose run --rm app sh -c 'python manage.py migrate';
fi