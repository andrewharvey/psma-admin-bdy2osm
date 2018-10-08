#!/bin/bash

mkdir -p geojson_osm
for state in {1..9}; do
    echo $state
    ./lga.js < geojson/${state}_LGA.geojson > geojson_osm/${state}_LGA_OSM.geojson
    ./sl.js < geojson/${state}_SL.geojson > geojson_osm/${state}_SL_OSM.geojson
done
