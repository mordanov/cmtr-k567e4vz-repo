#!/bin/bash
set -e
cd /home/ec2-user/flask-app
pip3 install -r requirements.txt || true
