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

# fkt identifier for type of building (sportsbar, adventure park, golfcourse etc). it is an optional value
select * where {
?s a :Location ; rdfs:label ?n ; geo:hasDefaultGeometry/geo:asWKT ?bfgeo ; geo:sfContains ?p .
?p a :Areas_d_b ; rdfs:label ?n2 ; geo:hasDefaultGeometry/geo:asWKT ?bfgeo2 .
OPTIONAL {?p :fkt ?fkt .}
#filter (?n != ?n2)
#filter (?n = 'Rust')
}
#limit 10
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
?s a :BuildingFacility ; rdfs:label ?n ; geo:hasDefaultGeometry ?g ; geo:ehInside ?o .
?g a geo:Geometry, sf:Polygon ; geo:asWKT ?geo .
?o a :Location ; :municipality ?n2 .
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

select ?n ?sgeo ?n2 ?lgeo where {
?s a :SpecialFacility ;  rdfs:label ?n ; geo:hasDefaultGeometry ?sg ; geo:ehInside ?o .
?sg a geo:Geometry, sf:Polygon ; geo:asWKT ?sgeo .
?o a :Location ; rdfs:label ?n2 ; geo:hasDefaultGeometry ?lg .
?lg a geo:Geometry, sf:Polygon ; geo:asWKT ?lgeo .
#filter (?n2 = 'Waltershof')
}
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
?s a :Location ; rdfs:label ?n ; geo:hasDefaultGeometry ?geo ;geo:ehInside ?p .
?geo a geo:Geometry, sf:Polygon ; geo:asWKT ?ngeo .
?p a :Administrative ; rdfs:label ?a .
#filter (?n = 'Rust')
}
limit 10
[QueryItem="building within settlement"]
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

# buildings for said settlement
SELECT ?loclabel  ?blabel(COUNT(?b) AS ?count) ?geo WHERE {
  ?b a :Building ;
     rdfs:label ?blabel ;
     geo:asWKT ?geo ;
     geo:ehInside ?loc .

  ?loc a :Location ;
       rdfs:label ?loclabel .
  #FILTER (?loclabel = "Berlin")
}
GROUP BY ?loclabel ?geo ?blabel
ORDER BY DESC(?count)
[QueryItem="asdasd"]
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

SELECT * WHERE {
#?a a :WaterBody ; rdfs:label ?label ; geo:sfIntersects <http://example.org/ontologies/atkis#Location/14603> .

?a a :WaterBody ; rdfs:label ?label ; geo:hasDefaultGeometry ?g ; geo:sfIntersects ?loc .
?g a sf:Polygon ; geo:asWKT ?geo .
?loc a :Location . ?loc  rdfs:label ?locname ; geo:hasDefaultGeometry ?locgeo .
?locgeo a geo:Geometry, sf:Polygon ; geo:asWKT ?locwkt .
FILTER(?label = "Rhein")
}
[QueryItem="all citis and total buildings (sie05 only)"]
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


SELECT ?loclabel (COUNT(?b) AS ?count) (GROUP_CONCAT(?blabel; separator=", ") AS ?buildingNames) (GROUP_CONCAT(?geo; separator=", ") AS ?geoNames) WHERE {
  ?b a :Building ;
     rdfs:label ?blabel ;
     geo:asWKT ?geo ;
     geo:ehInside ?loc .

  ?loc a :Location ;
       rdfs:label ?loclabel .

}
GROUP BY ?loclabel
ORDER BY DESC(?count)
[QueryItem="all instances of superclass settlement"]
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


SELECT * WHERE {
?s a :Settlement .
}
[QueryItem="given settlement, give me x type of building based on given radius"]
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
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>

select * where {
?a a :Location ; rdfs:label ?loclabel ; geo:hasDefaultGeometry ?locgeo ;geo:sfContains ?s .
?locgeo a sf:Polygon ; geo:asWKT ?locgeolabel .
?s rdfs:label ?alabel ; :objart ?objart ; geo:hasDefaultGeometry ?ageo .
?ageo a sf:Polygon ; geo:asWKT ?ageolabel .
#sport feature types
filter(?objart = "41008")
}
#limit 5
[QueryItem="buildings"]
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

# give buildings around X building facility
SELECT * WHERE{
    ?b a :BuildingFacility ; rdfs:label ?bfgeoLabel ; geo:hasDefaultGeometry/geo:asWKT ?bfgeo .
    filter (?bfgeoLabel = "Karlsruher Pyramide") #historical building X
    BIND("red" as ?bfgeoColor)
  
 ?a a :Building ; rdfs:label ?ageoLabel ; geo:hasDefaultGeometry/geo:asWKT ?ageo.
bind(geof:distance(?bfgeo, ?ageo, uom:metre) as ?distance)
  
 # BIND(geof:buffer(?bfgeo, 0.1, uom:degree) AS ?bufferedgeom)
 # BIND("red" as ?bufferedgeomColor)
}
limit 10
]]
[QueryItem="traffiuc"]
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
?rt a :RoadTraffic ; rdfs:label ?rgeoLabel ; geo:hasDefaultGeometry/geo:asWKT ?rgeo ; geo:sfCrosses ?loc .
  BIND("red" as ?rgeoColor)
?loc a :Location ; rdfs:label ?locname ; geo:hasDefaultGeometry/geo:asWKT ?locgeo .
  BIND("grey" as ?locgeoColor)
filter(?locname = "Hechingen")
}
[QueryGroup="water"] @collection [[
[QueryItem="water count fragment"]
PREFIX go: <http://purl.org/obo/owl/GO#>
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?waterLabel (SUM(?length) as ?totalLength) WHERE {
?a a :WaterBodyCourse ; rdfs:label ?waterLabel  ; geo:hasDefaultGeometry ?g .   
?g a sf:LineString ; geo:asWKT ?water ; geo:hasMetricLength ?length

#specify river here
FILTER(?waterLabel = "Wehra")
}
group by ?waterLabel
[QueryItem="water fragments count"]
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX go: <http://purl.org/obo/owl/GO#>
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?waterLabel (COUNT(?length) AS ?count) WHERE {
?a a :WaterBodyCourse ; rdfs:label ?waterLabel ; geo:hasDefaultGeometry ?g .   
?g a sf:LineString ; geo:asWKT ?water .  ?g geo:hasMetricLength ?length .

# total count of geom feature of specified river, 
#FILTER(?waterLabel = "Mühlbach")
}
GROUP BY ?waterLabel
# can comment out to get all river fragment
#ORDER BY DESC (?count)
[QueryItem="waterbody through veg"]
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
PREFIX schema: <http://schema.org/>

SELECT * WHERE {
?a a :VegetationArea ; rdfs:label ?veg ; geo:hasDefaultGeometry/geo:asWKT ?veggeo ; geo:sfContains ?b .
?b a :WaterBodyCourse ; rdfs:label ?water ; geo:hasDefaultGeometry/geo:asWKT ?wategeo .
}
[QueryItem="waterbody course through city"]
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX go: <http://purl.org/obo/owl/GO#>
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

# see which river passes through city
# the river starts from Nederland, but ATKIS has data only about Germany
SELECT * WHERE {
?a a :WaterBodyCourse ; rdfs:label ?waterLabel ; geo:hasDefaultGeometry ?g ; geo:sfIntersects ?loc .	
?g a sf:Polygon ; geo:asWKT ?water .
 BIND("red" as ?waterColor)
?loc a :Location ; rdfs:label ?locationLabel ; geo:hasDefaultGeometry ?locgeo .
?locgeo a geo:Geometry, sf:Polygon ; geo:asWKT ?location .
  BIND("blue" as ?locationColor)
FILTER(?waterLabel = "Rhein")
}
#limit 1
]]
[QueryItem="traffically connected areas"]
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
PREFIX schema: <http://schema.org/>

select * where {
?t a :Paths ; geo:hasDefaultGeometry/geo:asWKT ?wkt ; geo:sfContains ?s .
?s a :Location ; geo:hasDefaultGeometry/geo:asWKT ?wkt2 ; rdfs:label ?cityLabel .
}
[QueryItem="count traffic paths on each settlement"]
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
PREFIX schema: <http://schema.org/>

SELECT ?tLabel (COUNT(?length) as ?totalLength) WHERE {
?a a :Paths ; rdfs:label ?tLabel ; geo:hasDefaultGeometry/geo:asWKT ?wkt ; geo:hasMetricLength ?length .
}
group by ?tLabel
#ORDER BY DESC (?totalLength)
[QueryItem="stuffistuff"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX schema: <http://schema.org/>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>

 SELECT * WHERE {
        ?r a :WaterBodyCourse; rdfs:label ?name ; geo:hasDefaultGeometry/geo:asWKT ?wkt .

        ?c a :Location ; rdfs:label ?name1 ; geo:hasGeometry/geo:asWKT ?wkt1 .
        Filter(geof:sfIntersects(?wkt, ?wkt1))
        }

#limit 100
[QueryItem="own featue mapping"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX schema: <http://schema.org/>

SELECT * WHERE {
    ?a a schema:City; geo:hasDefaultGeometry/geo:asWKT ?wkt ; rdfs:label ?label .
    filter(?label ='Birndorf') 
    
    ?a1 a schema:City; geo:hasDefaultGeometry/geo:asWKT ?wkt1 ; rdfs:label ?label1 .
    BIND(geof:distance(?wkt, ?wkt1, uom:metre) AS ?distance )
    }
[QueryItem="waterbody intersects with location"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX schema: <http://schema.org/>

   SELECT * WHERE {
        ?s a :WaterBodyCourse ; rdfs:label ?name ; geo:hasGeometry/geo:asWKT ?wkt .
        filter(?name = 'Rhein')
        ?s1 a :Location ; rdfs:label ?name2 ; geo:hasGeometry/geo:asWKT ?wkt1 .
        
        filter(contains(str(?s1),"/f/"))
        filter(geof:sfIntersects(?wkt, ?wkt1))
        }
        LIMIT 10000
[QueryItem="distance of points from location"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX schema: <http://schema.org/>

SELECT * WHERE {
    ?b a :Location; rdfs:label ?label ; geo:hasDefaultGeometry/geo:asWKT ?wkt .
    
   ?a a :Administrative; rdfs:label ?label1 ; :bez ?district ; geo:hasDefaultGeometry/geo:asWKT ?wkt1 .
    FILTER(geof:sfWithin(?wkt, ?wkt1))
    }
[QueryItem="buffer with shcema city"]
PREFIX schema: <http://schema.org/>

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

SELECT * WHERE{
    ?b a :BuildingFacility ; rdfs:label ?bfgeoLabel  ; geo:hasDefaultGeometry/geo:asWKT ?bfgeo .
    filter (?bfgeoLabel = "Haxter Warte") #historical building X
    #BIND("red" as ?bfgeoColor)
 
BIND("POINT(9.12544501197443 51.39174356537089)"^^geo:wktLiteral as ?bind)
    #?a a :Building ; rdfs:label ?ageoLabel ; geo:hasDefaultGeometry/geo:asWKT ?ageo .
#    filter(geof:distance(?bfgeo, ?ageo, uom:metre) < 300)
       Bind(geof:distance(?bfgeo, ?bind, uom:metre) as ?distance)   

    #BIND(geof:buffer(?bfgeo, 300, uom:metre) AS ?bufferedgeom)
    #BIND("red" as ?bufferedgeomColor)
    }
[QueryItem="test of admin"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX schema: <http://schema.org/>

SELECT * WHERE {
    ?b a :Location; rdfs:label ?label ; geo:hasDefaultGeometry/geo:asWKT ?wkt .
    
   ?a a :Administrative; rdfs:label ?label1 ; :bez ?district ; geo:hasDefaultGeometry/geo:asWKT ?wkt1 .
    FILTER(geof:sfWithin(?wkt, ?wkt1))
    }
#    limit 10000
[QueryItem="railroute intersect"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX schema: <http://schema.org/>

 SELECT * WHERE{
        ?t a :RailwayTraffic; geo:hasDefaultGeometry/geo:asWKT ?wkt ; rdfs:label ?name .
        ?t1 a :RailwayTraffic ; geo:hasDefaultGeometry/geo:asWKT ?wkt1  ; rdfs:label ?name1 .
        FILTER(geof:sfIntersects(?wkt, ?wkt1))
        }
[QueryGroup="prime queries q11-q15"] @collection [[
[QueryItem="q7 prime"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX schema: <http://schema.org/>

    SELECT * WHERE {
    ?r a :WaterBodyCourse; rdfs:label ?name ; geo:hasDefaultGeometry/geo:asWKT ?wkt ; geo:sfIntersects ?c .

    ?c a :Location; rdfs:label ?name1 ; geo:hasGeometry/geo:asWKT ?wkt1 .
    }
[QueryItem="q9 prime"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX schema: <http://schema.org/>

   SELECT * WHERE {
    ?b a :Location; rdfs:label ?label ; geo:hasDefaultGeometry/geo:asWKT ?wkt ; geo:sfWithin ?a .
    
   ?a a :Administrative; rdfs:label ?label1 ; :bez ?district ; geo:hasDefaultGeometry/geo:asWKT ?wkt1 .

    }
[QueryItem="q10 prime"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX schema: <http://schema.org/>

# this only returns 
SELECT * WHERE{
        ?t a :WaterBodyCourse ; geo:hasDefaultGeometry/geo:asWKT ?wkt  ; rdfs:label ?name ; geo:sfIntersects ?t1 .
        ?t1 a :Agricultural; geo:hasDefaultGeometry/geo:asWKT ?wkt1 ; rdfs:label ?name1 .
#filter(geof:sfIntersects(?wkt, ?wkt1))
        }
#limit 100000
]]
[QueryItem="buffet test from point"]
PREFIX schema: <http://schema.org/>
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>

SELECT * WHERE{
    ?b a :BuildingFacility ; rdfs:label ?wktLabel  ; geo:hasDefaultGeometry/geo:asWKT ?wkt .
    filter (?wktLabel = "Lethturm")
  
    ?b1 a :BuildingFacility ; rdfs:label ?bfgeo1Label  ; geo:hasDefaultGeometry/geo:asWKT ?bfgeo1 .
  	FILTER(contains(str(?b1), "/p"))
    BIND("blue" AS ?bfgeo1Color)
    
  	BIND(geof:buffer(?wkt, 5000, uom:metre) AS ?bufferedgeom)
	BIND("red" as ?bufferedgeomColor)
  	
 	BIND(geof:distance(?wkt, ?bfgeo1, uom:metre) AS ?distance)
  	FILTER(?distance <= 5000)
}
[QueryItem="new test og city geom4326"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX schema: <http://schema.org/>

 SELECT * WHERE {
    ?a a :Location ; rdfs:label ?label ; geo:hasDefaultGeometry ?geom .
    ?geom a geo:Geometry, sf:Point ; geo:asWKT ?wkt .
    
    ?a1 a :Location ; rdfs:label ?label1 ; geo:hasDefaultGeometry ?geom1 .
    ?geom1 a geo:Geometry, sf:Point ; geo:asWKT ?wkt1 .
    filter(?label1 = 'Oberhof')
    
    BIND(geof:distance(?wkt1, ?wkt, uom:metre) as ?distance)
    }
[QueryItem="get all triples from graph"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX schema: <http://schema.org/>

SELECT (COUNT(?s) AS ?triples) WHERE { ?s ?p ?o }
[QueryItem="leisure place tetsrt"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX schema: <http://schema.org/>

select * where {
?l a :LeisurePlace ; rdfs:label ?name .
}
[QueryItem="asdas"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX schema: <http://schema.org/>

   SELECT * WHERE{
        ?t a :Agricultural; geo:hasDefaultGeometry/geo:asWKT ?wkt ; rdfs:label ?name .
        ?t1 a :WaterBodyCourse ; geo:hasDefaultGeometry/geo:asWKT ?wkt1  ; rdfs:label ?name1 .#; geo:sfIntersects ?t .
        FILTER(geof:sfItntersects(?wkt1, ?wkt))
        }
limit 100
[QueryItem="shshsh"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX schema: <http://schema.org/>


SELECT * WHERE{
        ?t a :Agricultural; geo:hasDefaultGeometry/geo:asWKT ?wkt ; rdfs:label ?name .
        ?t1 a :WaterBodyCourse ; geo:hasDefaultGeometry/geo:asWKT ?wkt1  ; rdfs:label ?name1 .
        FILTER(geof:sfContains(?wkt, ?wkt1))
        }
        LIMIT 10000
[QueryItem="test new"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/ont/gml#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX schema: <http://schema.org/>