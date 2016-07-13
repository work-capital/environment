#!/bin/bash
# start synergy server
# this way synergy server will start listening on loopback network interface only, 
# instead on all network interfaces. This way we are only allowing access to synergy server 
# to locally authenticated use rs. You can now put this command in session startup.
synergys -a 127.0.0.1 -c synergy.conf
wait
printf "synergy server started at 10.0.0.3"
