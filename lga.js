#!/usr/bin/env node

var geojsonMap = require('geojson-map');

function titleCase(str) {
    return str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
};

function lga(feature) {
    const p = Object.assign({}, feature.properties);
    feature.properties = {
        type: 'boundary',
        boundary: 'administrative',
        admin_level: '6',
        place: 'municipality',
        name: titleCase(p.LGA_NAME),
        short_name: titleCase(p.ABB_NAME)
    };
    return feature;
}

process.stdin
    .pipe(geojsonMap(lga))
    .pipe(process.stdout);
