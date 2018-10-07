all: download extract geojson geojsonOSM topojson osm

download:
	wget 'https://tianjara.net/data/psma-admin-bdys/Suburbs%20-%20Localities%20AUGUST%202018.tar.xz'
	wget 'https://tianjara.net/data/psma-admin-bdys/Local%20Government%20Areas%20AUGUST%202018.tar.xz'

extract:
	tar -xJvvf Local\ Government\ Areas\ AUGUST\ 2018.tar.xz
	tar -xJvvf Suburbs\ -\ Localities\ AUGUST\ 2018.tar.xz

geojson:
	ogr2ogr -f GeoJSON -select 'LGA_NAME,ABB_NAME' LGA.geojson 'Local Government Areas AUGUST 2018.shp'
	ogr2ogr -f GeoJSON -select 'NAME' SL.geojson 'Suburbs - Localities AUGUST 2018.shp'

geojsonOSM:
	./lga.js < LGA.geojson > LGA_OSM.geojson
	./sl.js < SL.geojson > SL_OSM.geojson

topojson:
	node --max_old_space_size=4096 /usr/bin/geo2topo -q0 -o PSMA_Admin_Bdy.topojson LGA=LGA_OSM.geojson SL=SL_OSM.geojson

osm:
	node --max_old_space_size=4096 ./node_modules/.bin/topo2osm < PSMA_Admin_Bdy.topojson > PSMA_Admin_Bdy.osm

clean:
	rm -rf *.tar.xz Local* Suburbs* *.topojson *.geojson *.osm

