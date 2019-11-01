#!/bin/bash

mkdir -p geojson
for state in {1..9}; do
    echo $state
    ogr2ogr -f GeoJSON -select 'LGA_NAME,ABB_NAME' -where "STATE_PID='$state'" geojson/${state}_LGA.geojson 'Local Government Areas AUGUST 2019.shp'
    ogr2ogr -f GeoJSON -select 'NAME,LOCCL_CODE' -where "STATE_PID='$state' AND LOCCL_CODE IN ('G', 'D')" geojson/${state}_SL.geojson 'Suburbs - Localities AUGUST 2019.shp'
done
