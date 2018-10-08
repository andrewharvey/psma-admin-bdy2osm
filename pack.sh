#!/bin/bash

for state in {1..9}; do
    echo $state
    xz -k osm/${state}.osm
done
