[QueryItem="check if area in sie02 isLocatedIn sie01"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?idA ?idB {
?area a :Area ; :objectId ?idA ; :hasArea ?s .
?s a :Settlement ; :objectId ?idB .
}
[QueryItem="Settlement name and their rgs name"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?settlement ?name ?rgs{
?settlement a :Settlement ;
:location ?name ;
:rgs ?rgs .
}
[QueryItem="geometry of areas as well known text"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?area ?name ?geo {
?area a :Area ; :name ?name ; :geometry ?geo . 
}
[QueryItem="Special Facilties name and what type they are"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?sf ?name ?type {
?sf a :SpecialFacility ; :name ?name ; :objecttxt ?type .
}
[QueryGroup="testing queries"] @collection [[
[QueryItem="areas with settlement association"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?area ?specialfacility WHERE {
?sf a :SpecialFacility ; :name ?specialFacility ; :hasArea ?a .
?a a :Settlement ; :location ?area .
}
[QueryItem="Building within Settlement"]
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>

SELECT ?building ?point ?settlement ?polygon 
WHERE {
  ?bA a :Building ; :name ?building ; :isLocatedIn ?sE ; :geometry ?point .
  ?sE a :Settlement ; :location ?settlement ; :geometry ?polygon.
}
ORDERBY ASC (?settlement)
]]
[QueryItem="districts within area"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?gid ?district ?area WHERE {
?gid a :Area ; :district ?district ; :area ?area .
}
[QueryItem="traffic codes"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#connect to paths, points/polygons
select ?code where {
?t a :Traffic ; :name ?code .
}
[QueryItem="long lat area"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?area ?long ?lat ?om WHERE {
?sf a :Area ; :name ?area ; :long ?long ; :lat ?lat ; :bound ?om .
}
[QueryItem="ss"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>

select ?name where {
  ?loc rdfs:label ?name .
  ?loc geo:hasGeometry ?feature .
  ?hq geo:hasGeometry ?hqGeo ; rdfs:label "Stardog HQ" .
  ?feature geof:nearby (?hqGeo 2 <http://qudt.org/vocab/unit#Kilometer>).
}
[QueryItem="veg and area intersect"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?v ?a ?b ?c where {
?v a :Vegetation ; :name ?c ; :intersectsWith ?a .
?a a :Area ; :name ?b .
}
[QueryItem="asd"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>

SELECT ?dist WHERE {
:bayern geo:hasGeometry ?wkt1.
:hessen geo:hasGeometry ?wkt2 .
BIND(geo:distance(?wkt1, ?wkt2) as ?dist)
}
[QueryGroup="settlement 01X group"] @collection [[
[QueryItem="sie01 points"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?s ?wkt ?n where {
?s a :Settlement ; :point ?wkt ; :name ?n .
}
[QueryItem="sie01 polygons"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?s ?wkt ?n where {
?s a :Settlement ;  :polygon ?wkt ; :name ?n .
}
]]
[QueryGroup="settlement 02 group"] @collection [[
[QueryItem="sie02 polygon"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?b ?a ?wkt where {
?b a :Building ; :name ?a ; :buildingPolygon ?wkt .
}
]]
[QueryGroup="settlement 03 group"] @collection [[
[QueryItem="sie03 buildings by cat. (sport, history, industry etc)"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?s ?n ?o ?wkt where {
?s a :Settlement ; :name ?n ; :objart_txt ?o ; rdf:geometry ?wkt .
}
]]
[QueryGroup="sie04"] @collection [[
[QueryItem="sie04_f"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?s ?n ?wkt where {
?s a :Settlement ; :name ?n ; :sie04_polygon ?wkt .
}
[QueryItem="sie04_l"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?s ?n ?wkt where {
?s a :Settlement ; :name ?n ; :sie04Linestring ?wkt .
}
[QueryItem="sie04_p"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?s ?n ?wkt WHERE {
?s a :Settlement ; :name ?n ; :sie04Point ?wkt .
}
]]
[QueryItem="sie05 point"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?s ?n ?wkt where {
?s a :Settlement ; :name ?n ; :sie05_p ?wkt .
}
[QueryGroup="Traffic (ver)"] @collection [[
[QueryItem="ver01"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?t ?wkt ?n where {
?t a :Traffic ; :name ?n ; :geometry ?wkt .
}
[QueryItem="ver04"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT * WHERE {
?s a :Traffic ; geo:hasGeometry ?g .
?g a :Traffic ; rdfs:label ?name ; geo:asWKT ?wktLabel .
}
[QueryItem="ver03"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT * WHERE {
?a a :Traffic ; geo:hasGeometry ?b .

}
]]
[QueryGroup="newMappingQueries"] @collection [[
[QueryItem="Administrative polygon"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX geoname: <https://www.geonames.org/ontology/ontology_v3.3.rdf>

SELECT ?gid ?bez_lan ?wkt
WHERE {
  ?f a :Administrative ;
     rdfs:label ?bez_lan ;
     geo:hasDefaultGeometry ?geo .
  
  ?geo a geo:Geometry , sf:Polygon ;
       geo:asWKT ?wkt .
  
  BIND(STRAFTER(str(?geo), "/f/") AS ?gid)
}
limit 5
[QueryItem="Administrative dist Linestring"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX geoname: <https://www.geonames.org/ontology/ontology_v3.3.rdf>

#:Administrative/l/{gid} a :Administrative ; geo:hasDefaultGeometry :Administrative/geo/l/{gid} . :Administrative/geo/l/{gid} a geo:Geometry , sf:LineString ; geo:asWKT #{wkt}^^geo:wktLiteral . 

SELECT * WHERE {
  ?f a :Administrative ;
     geo:hasDefaultGeometry ?geo .
  
  ?geo a geo:Geometry, sf:LineString ;
       geo:asWKT ?wkt .
  
  BIND(STRAFTER(str(?geo), "/l/") AS ?gid)
}
limit 50
[QueryItem="get municipalities, their county and state they are in"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#this is using the GN250 dataset refered in dlm docs

SELECT ?s ?state ?county ?o ?settlement WHERE {
?s a :GN250 ; rdfs:label ?county ; :area ?state ; geo:sfWithin ?o.
?o a :Settlement ; rdfs:label ?settlement . 
}
]]
[QueryGroup="Settlement"] @collection [[
[QueryItem="leisuire, place within municipality"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select * where {
?s a :Settlement ; :municipality ?n ; :objid_z ?g1 ; geo:ehInside ?p .
?p a :Areas_d_b ; :place ?n2 ; :objart_z ?g2 .
filter (?n != ?n2)
#filter (?n = 'Rust')
}
limit 1
[QueryItem="municipality"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select * where {
?s a :Settlement ; rdfs:label ?p ; geo:hasDefaultGeometry ?o .
?o a geo:Geometry, sf:Polygon ; geo:asWKT ?geo .
 BIND(STRAFTER(str(?o), "/f/") AS ?gid)
}
limit 10
[QueryItem="leisure place"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select * where {
?s a :Areas_d_b ; rdfs:label ?n ; geo:hasDefaultGeometry ?o .
?o a geo:Geometry, sf:Polygon ; geo:asWKT ?geo .
}
[QueryItem="buildings, facilities, treatment plants"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select * where {
?s a :BuildingFacility ; rdfs:label ?n ; geo:ehInside ?o .
?o a :Settlement ; :municipality ?n2 .
}
limit 100
[QueryItem="special facilityes within a municipality"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select * where {
?s a :SpecialFacility ;  :hdu_x ?n ; geo:ehInside ?o .
?o a :Settlement ; :objid ?n2 .
}
limit 10
[QueryItem="describe class settlemnt"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#DESCRIBE ?s where {
#?s a :Settlement .
#}
Describe <http://example.org/ontologies/atkis#Building/p/2>
[QueryItem="municipality contained in state"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>

SELECT * Where {
?s a :Settlement ; :objid ?n ; :existsIn ?p .
?p a :Area ; :objid_z ?n2 .
#filter (?n = 'Rust')
}
limit 100
[QueryItem="tes2"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>

SELECT ?s ?buildingLabel ?buildingWKT (geof:distance(?buildingWKT, ?pointWKT, uom:metre) AS ?d)
WHERE {
  ?s a :Building ;
     rdfs:label ?buildingLabel ;
     geo:hasDefaultGeometry ?buildingGeometry .

  ?buildingGeometry a geo:Geometry, sf:Point ;
     geo:asWKT ?buildingWKT .

  BIND("POINT(9.210529390002849 50.20924802624827)"^^<http://www.opengis.net/ont/geosparql#wktLiteral> AS ?pointWKT)
}
LIMIT 1
]]