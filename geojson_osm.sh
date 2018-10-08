#!/bin/bash

mkdir -p geojson
for state in {1..9}; do
    echo $state
    ./lga.js < geojson/${state}_LGA.geojson > geojson/${state}_LGA_OSM.geojson
    ./sl.js < geojson/${state}_SL.geojson > geojson/${state}_SL_OSM.geojson
done
