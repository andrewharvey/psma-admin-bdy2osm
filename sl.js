#!/usr/bin/env node

var geojsonMap = require('geojson-map');

function titleCase(str) {
    return str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
};

function sl(feature) {
    const p = Object.assign({}, feature.properties);
    feature.properties = {
        type: 'boundary',
        boundary: 'administrative',
        admin_level: p.LOCCL_CODE === 'D' ? '7' : '10',
        name: titleCase(p.NAME),
    };

    if (p.LOCCL_CODE === 'D') {
        feature.properties.place = 'district';
    }

    return feature;
}

process.stdin
    .pipe(geojsonMap(sl))
    .pipe(process.stdout);
