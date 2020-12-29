#!/bin/bash

read -p "Enter command: " OPT

if [ "$OPT" = 'test' ] 
then
  echo "Running test suits ------- $OPT"
  exec docker-compose run --rm app sh -c 'python manage.py test && flake8';
elif [ "$OPT" = 'migrations' ] 
then
  echo "Creating Migrations ------- $OPT"
  exec docker-compose run --rm app sh -c 'python manage.py makemigrations';
elif [ "$OPT" = 'migrate' ] 
then
  echo "Migrating ------- $OPT"
  docker-compose run --rm app sh -c 'python manage.py migrate';
fi