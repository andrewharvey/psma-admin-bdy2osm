#!/bin/bash

mkdir -p osm
for state in {1..9}; do
    echo $state
    node --max_old_space_size=4096 ./node_modules/.bin/topo2osm < topojson/${state}.topojson > osm/${state}.osm
done
