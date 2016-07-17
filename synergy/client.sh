#!/bin/sh
#ssh -N -f -L 24800:localhost:24800 name@server
ssh user@server-hostname -L 24800:localhost:24800 -N
synergyc localhost
