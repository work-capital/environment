#!/bin/sh
ssh -N -f -L 24800:localhost:24800 name@server
synergyc localhost
