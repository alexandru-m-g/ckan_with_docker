#!/bin/bash
ln -sf /etc/ckan/ckan.ini ckan.ini
chown -R www-data:www-data /var/lib/ckan
exec gunicorn -w 2 -c /srv/ckan/docker/ckan/gunicorn_conf.py wsgi:application
