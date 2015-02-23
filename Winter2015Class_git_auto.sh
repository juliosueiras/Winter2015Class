#!/usr/bin/env bash
GIT_ROOT="/home/juliosueiras/Documents/Winter2015Class"
cd $GIT_ROOT
git add .
git commit -m "Time committed:$(date)"
git push
