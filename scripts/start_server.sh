#!/bin/bash
set -e
cat << 'UNIT' > /etc/systemd/system/flask-app.service
[Unit]
Description=Gunicorn instance to serve Flask app
After=network.target

[Service]
User=root
WorkingDirectory=/home/ec2-user/flask-app
ExecStart=/usr/local/bin/gunicorn --workers 2 --bind 0.0.0.0:8000 app:app
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
UNIT

if [ ! -f /usr/local/bin/gunicorn ]; then
  GUNICORN_BIN=$(which gunicorn || find / -name gunicorn 2>/dev/null | head -n 1)
  ln -sf "$GUNICORN_BIN" /usr/local/bin/gunicorn
fi

systemctl daemon-reload
systemctl enable flask-app
systemctl restart flask-app
