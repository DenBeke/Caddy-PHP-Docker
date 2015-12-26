#!/bin/bash

nohup php-fpm &

cd /caddy_working_dir
caddy -conf="/Caddyfile"
