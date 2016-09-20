#!/bin/sh
#ssh -N -f -L 24800:localhost:24800 name@server
ssh -f henry@10.0.0.7 -L 24800:localhost:24800 -N
synergyc localhost
