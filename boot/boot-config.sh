#!/bin/bash
# linux users using mac keyboard that wants the F1, F2, etc... without
echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode
