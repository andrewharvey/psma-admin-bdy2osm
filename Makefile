all: download extract geojson geojson_osm topojson osm pack

download:
	wget 'https://tianjara.net/data/psma-admin-bdys/Localities%20FEBRUARY%202020.tar.xz'
	wget 'https://tianjara.net/data/psma-admin-bdys/Local%20Government%20Areas%20NOVEMBER%202019.tar.xz'

extract:
	tar -xJvvf Local\ Government\ Areas\ NOVEMBER\ 2019.tar.xz
	tar -xJvvf Localities\ FEBRUARY\ 2020.tar.xz

geojson:
	./geojson.sh

geojson_osm:
	./geojson_osm.sh

topojson:
	./topojson.sh

simplify:
	./simplify.sh

osm:
	./osm.sh

pack:
	./pack.sh

clean:
	rm -rf *.tar.xz Local* Suburbs* geojson geojson_osm topojson osm

