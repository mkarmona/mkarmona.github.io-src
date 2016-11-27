#!/bin/bash

rm -Rf public/
hugo server -v true -D true --verboseLog=true -b $1 -p $2 --watch
