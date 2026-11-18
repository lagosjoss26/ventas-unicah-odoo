FROM odoo:20.0
COPY ./custom_addons /mnt/extra-addons
CMD python3 -c "import os, urllib.parse; u=urllib.parse.urlparse(os.environ.get('DATABASE_URL','')); host=u.hostname or 'localhost'; port=str(u.port or 5432); user=urllib.parse.unquote(u.username or 'odoo'); pw=urllib.parse.unquote(u.password or ''); os.execvp('odoo', ['odoo', '--db_host='+host, '--db_port='+port, '--db_user='+user, '--db_password='+pw, '--http-interface=0.0.0.0', '--http-port='+os.environ.get('PORT','10000'), '--addons-path=/mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons', '--list-db=True'])"
