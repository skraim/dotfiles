#!/bin/bash

sudo docker start 6e97cd5a9f98
sleep 3;

sudo docker start e21fbaaae287
sleep 3;

sudo docker ps --all
