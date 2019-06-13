#!/bin/bash

rsync -urltv --delete -e ssh /home/langevin/ploquivi/I1/GPI/web/ root@192.168.56.101:/var/www/html/
