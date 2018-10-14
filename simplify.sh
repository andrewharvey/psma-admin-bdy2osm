#!/bin/bash

mkdir -p topojson-simplified
for state in {1..9}; do
    echo $state
    node --max_old_space_size=4096 /usr/bin/toposimplify --filter-all --filter-detached --spherical-area 0.0000000000001 -o topojson-simplified/${state}.topojson topojson/${state}.topojson
done
