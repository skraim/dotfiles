#!/bin/bash

sudo docker stop e21fbaaae287
sudo docker stop 6e97cd5a9f98
sleep 3;

sudo docker ps --all
