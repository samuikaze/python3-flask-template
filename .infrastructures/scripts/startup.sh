#!/bin/sh

nginx -g 'daemon on;'
gunicorn --workers 3 --bind unix:/var/run/gunicorn-app.sock -m 777 --access-logfile - app:app
