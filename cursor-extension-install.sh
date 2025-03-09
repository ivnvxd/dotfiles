#!/usr/bin/env bash

cat cursor-extensions.txt | while read extension || [[ -n $extension ]];
do
    cursor --install-extension $extension --force
done