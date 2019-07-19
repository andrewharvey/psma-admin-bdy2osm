#!/bin/bash

mkdir -p topojson-simplified
for state in {1..9}; do
    echo $state
    node --max_old_space_size=4096 ./node_modules/.bin/toposimplify --filter-all --filter-detached --spherical-area 0.0000000000001 -o topojson-simplified/${state}.topojson topojson/${state}.topojson

    # roundtrip to remove duplicate arcs and join adjancent arcs only used once https://github.com/topojson/topojson-simplify/issues/4
    ./node_modules/.bin/topo2geo < topojson-simplified/${state}.topojson LGA=topojson-simplified/LGA_${state}.json SL=topojson-simplified/SL_${state}.json
    ./node_modules/.bin/geo2topo LGA=topojson-simplified/LGA_${state}.json SL=topojson-simplified/SL_${state}.json > topojson-simplified/${state}.topojson
    rm topojson-simplified/LGA_${state}.json topojson-simplified/SL_${state}.json
done
