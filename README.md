Caddy PHP Docker
================

WIP: don't use it yet.

Running the image:

    sudo docker run \
        -p 80:80 \
        -p 443:443 \
        -v /home/mathias:/caddy_working_dir \
        denbeke/caddy

*Replace `/home/mathias` with your Caddy working dir*