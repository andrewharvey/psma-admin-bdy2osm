# psma-admin-bdys2osm

This repo converts [PSMA Administrative Boundaries](https://data.gov.au/dataset/psma-administrative-boundaries) data into [OSM XML](https://wiki.openstreetmap.org/wiki/OSM_XML).

The data publisher has [completed the OSMF CC BY waiver](https://wiki.openstreetmap.org/wiki/File:Department_of_Industry_Innovation_and_Science_ODbl_permission_Administrative_Boundaries.pdf) clearing the licensing aspect of an OSM import.

This conversion process outputs results as [relations](https://wiki.openstreetmap.org/wiki/Relation) ensuring shared borders are only represented once.

## Tagging

### Local Government Areas
```
type=boundary
boundary=administrative
admin_level=6
place=municipality
name=
short_name=
```

With optional tags `wikidata`, `website`, `phone`, `email`.

### Suburbs / Localities
```
type=boundary
boundary=administrative
admin_level=10
name=
```

Data also contains ACT Districts which are mapped to `admin_level=7` + `place=district` and SA Hundreds which are ommitted.

With optional tags `place`, `postal_code`, `wikidata`.

## Processing

https://github.com/andrewharvey/psma-admin-bdys-data is used to help process the upstream data, either run through that process or shortcut to the prebuild files using:

    make download extract

Convert the Shapefiles to GeoJSON

    yarn install
    make geojson geojson_osm

Convert the GeoJSON to TopoJSON

    make topojson

Simplify the TopoJSON to reduce excess nodes

    make simplify

Convert the TopoJSON to OSM

    make osm

# Outputs

Processed outputs at https://tianjara.net/data/PSMA_AdminBdy_OSM/
Processed outputs at https://tianjara.net/data/PSMA_AdminBdy_OSM_Simplified/
