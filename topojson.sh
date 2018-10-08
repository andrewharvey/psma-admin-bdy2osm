#!/bin/bash

mkdir -p topojson
for state in {1..9}; do
    echo $state
    node --max_old_space_size=4096 /usr/bin/geo2topo -q0 -o topojson/${state}.topojson LGA=geojson_osm/${state}_LGA_OSM.geojson SL=geojson_osm/${state}_SL_OSM.geojson
done
