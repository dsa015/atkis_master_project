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
PREFIX geoname: <https://www.geonames.org/ontology/ontology_v3.3.rdf>

SELECT ?gid ?bez_lan ?wkt
WHERE {
  ?f a schema:AdministrativeArea ;
     rdfs:label ?bez_lan ;
     geo:hasDefaultGeometry ?geo .
  
  ?geo a geo:Geometry , sf:Polygon ;
       geo:asWKT ?wkt .
  
  BIND(STRAFTER(str(?geo), "/f/") AS ?gid)
}
limit 5
[QueryItem="Administrative dist Linestring"]
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
PREFIX geoname: <https://www.geonames.org/ontology/ontology_v3.3.rdf>

#:Administrative/l/{gid} a :Administrative ; geo:hasDefaultGeometry :Administrative/geo/l/{gid} . :Administrative/geo/l/{gid} a geo:Geometry , sf:LineString ; geo:asWKT #{wkt}^^geo:wktLiteral . 

SELECT * WHERE {
  ?f a schema:AdministrativeArea ;
     geo:hasDefaultGeometry ?geo .
  
  ?geo a geo:Geometry, sf:LineString ;
       geo:asWKT ?wkt .
  
  BIND(STRAFTER(str(?geo), "/l/") AS ?gid)
}
limit 50
[QueryItem="get municipalities, their county and state they are in"]
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
PREFIX geoname: <https://www.geonames.org/ontology/ontology_v3.3.rdf>

#this is using the GN250 dataset refered in dlm docs

SELECT ?s ?state ?county ?o ?settlement WHERE {
?s a :GN250 ; rdfs:label ?county ; :area ?state .
}
]]
[QueryGroup="Settlement"] @collection [[
[QueryItem="leisuire, place within municipality"]
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

# fkt identifier for type of building (sportsbar, adventure park, golfcourse etc). it is an optional value
select * where {
?s a schema:City; rdfs:label ?n ; geo:hasDefaultGeometry/geo:asWKT ?bfgeo ; geo:sfContains ?p .
?p a :AreaDominatedByBuilding ; rdfs:label ?n2 ; geo:hasDefaultGeometry/geo:asWKT ?bfgeo2 .
#filter (?n = 'Rust')
filter(?n != ?n2)
}
#limit 10
[QueryItem="municipality"]
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


select * where {
?s a schema:City ; rdfs:label ?city ; geo:hasDefaultGeometry/geo:asWKT ?wkt .
BIND(STRAFTER(str(?o), "/f/") AS ?gid)
}
#limit 10
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

SELECT * Where {
?a a schema:City ; rdfs:label ?city ; geo:hasDefaultGeometry/geo:asWKT ?citywkt ; geo:ehInside ?p .
?p a schema:AdministrativeArea ; rdfs:label ?state .
#filter (?city = 'Rust')
}
#limit 5
[QueryItem="building within settlement"]
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

# buildings for said settlement
SELECT ?loclabel  ?blabel(COUNT(?b) AS ?count) ?geo WHERE {
  ?b a :Building ; rdfs:label ?blabel ; geo:hasDefaultGeometry/geo:asWKT ?geo ; geo:ehInside ?loc .

 ?loc a schema:City ; rdfs:label ?loclabel .
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


SELECT * WHERE {
?s a schema:City .
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
[QueryItem="building buffer"]
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>

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


# give buildings around X building facility
select *  {
    ?b a :BuildingFacility ; rdfs:label ?bfgeoLabel ; geo:hasDefaultGeometry/geo:asWKT ?bfgeo .
    filter (?bfgeoLabel = "Karlsruher Pyramide") #historical building X
    BIND("red" as ?bfgeoColor)
  
  ?a a :Building ; rdfs:label ?ageoLabel ; geo:hasDefaultGeometry/geo:asWKT ?ageo .
 filter(geof:distance(?bfgeo, ?ageo, uom:metre) < 300)

  
  BIND(geof:buffer(?bfgeo, 10000, uom:metre) AS ?bufferedgeom)
  BIND("red" as ?bufferedgeomColor)
}
[QueryItem="railrout in city"]
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
?a a schema:City ; rdfs:label ?city ; geo:sfContains ?p ; rdfs:label ?routename .
  ?p a schema:TrainTrip .
#Filter (?city = 'Leinefelde')
}
[QueryItem="road trffic and stuff"]
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
?s a :RoadTraffic ; rdfs:label ?trafficLabel ; geo:hasDefaultGeometry/geo:asWKT ?trafficWkt ; geo:sfCrosses ?a .
?a a schema:City ; rdfs:label ?cityLabel ; geo:hasDefaultGeometry/geo:asWKT ?cityWkt .
Filter (?cityLabel = 'Binzen')
}
[QueryItem="test area domi"]
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
?s a :AreaDominatedByBuilding ; rdfs:label ?name ; :objart ?t .
}
[QueryItem="buildings buffered within settlement"]
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
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>

SELECT * WHERE {
  ?state a schema:City ;
         rdfs:label ?statename ;
         geo:hasDefaultGeometry/geo:asWKT ?stateGeo .
filter(?statename ='Mitteltal')

BIND(geof:buffer(?stateGeo, 300, uom:metre) AS ?bufferArea)
  
  ?city a :AreaDominatedByBuilding ;
       rdfs:label ?cityLabel ;
        geo:hasDefaultGeometry/geo:asWKT ?cityGeo .
        
  FILTER(geof:sfIntersects(?cityGeo, ?stateGeo))

 #BIND("red" AS ?bufferColor)
}
[QueryItem="testitest"]
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

# fkt identifier for type of building (sportsbar, adventure park, golfcourse etc). it is an optional value
SELECT * WHERE {
  ?s a schema:City; 
     rdfs:label ?n; 
     geo:hasDefaultGeometry/geo:asWKT ?bfgeo; 
     geo:sfContains ?p .
     
  {
    ?p a :AreaDominatedByBuilding; 
       rdfs:label ?n2; 
       geo:hasDefaultGeometry/geo:asWKT ?bfgeo2 .
  }
  UNION
  {
    ?p a :SpecialFacility; 
       rdfs:label ?n2; 
       geo:hasDefaultGeometry/geo:asWKT ?bfgeo2 .
  }
  UNION
  {
    ?p a :Building; 
       rdfs:label ?n2; 
       geo:hasDefaultGeometry/geo:asWKT ?bfgeo2 .
  }
  UNION
  {
    ?p a :BuildingFacility; 
       rdfs:label ?n2; 
       geo:hasDefaultGeometry/geo:asWKT ?bfgeo2 .
  }
  
  FILTER(?n != ?n2)
}
#LIMIT 10
[QueryItem="find entities of class that intersect polygon"]
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
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>

select ?a ?v  ?cityLabel where {
?a a schema:City ; geo:hasDefaultGeometry/geo:asWKT ?wkt ; rdfs:label ?cityLabel .
<http://schema.org/AdministrativeArea/f/21> a ?t ; geo:hasDefaultGeometry/geo:asWKT ?wkt2 ; rdfs:label ?v .
filter(geof:sfContains(?wkt2, ?wkt))
Filter(?v ='Ortenau')
}
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
?a a :Agricultural ; rdfs:label ?veg ; geo:hasDefaultGeometry/geo:asWKT ?veggeo ; geo:sfContains ?b .
?b a schema:RiverBodyOfWater ; rdfs:label ?water ; geo:hasDefaultGeometry/geo:asWKT ?wategeo .
}
[QueryItem="waterbody course through city"]
PREFIX schema: <http://schema.org/>

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
?a a schema:RiverBodyOfWater ; rdfs:label ?waterLabel ; geo:hasDefaultGeometry/geo:asWKT ?water ; geo:sfIntersects ?loc .	
#?g a sf:Polygon ; geo:asWKT ?water .
 BIND("red" as ?waterColor)
?loc a schema:City; rdfs:label ?locationLabel ; geo:hasDefaultGeometry/geo:asWKT ?location .
#?locgeo a geo:Geometry, sf:Polygon ; geo:asWKT ?location .
  BIND("blue" as ?locationColor)
FILTER(?waterLabel = "Rhein")
} 
#limit 1
[QueryItem="waterbtest"]
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
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>

SELECT * WHERE {
?a a :Agricultural ; rdfs:label ?veg ; geo:hasDefaultGeometry/geo:asWKT ?veggeo ; geo:sfContains ?b .
?b a schema:RiverBodyOfWater; rdfs:label ?water ; geo:hasDefaultGeometry/geo:asWKT ?wategeo .

}
limit 1
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
?t a :Path ; geo:hasDefaultGeometry/geo:asWKT ?wkt ; geo:sfContains ?s .
?s a schema:City ; geo:hasDefaultGeometry/geo:asWKT ?wkt2 ; rdfs:label ?cityLabel .
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
[QueryItem="train stuff"]
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

SELECT * WHERE {
?a a :RailwayTraffic ; geo:sfContains ?p .
?p a schema:TrainTrip ; rdfs:label ?route .
}
[QueryItem="asdadsda"]
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX schema: <http://schema.org/>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>


SELECT * WHERE {

?a a :Location ; geo:hasDefaultGeometry/geo:asWKT ?wkt ; rdfs:label ?label .
filter(?label ='Birndorf') 

?a1 a :Location ; geo:hasDefaultGeometry/geo:asWKT ?wkt1 ; rdfs:label ?label1 .

BIND(geof:distance(?wkt, ?wkt1, uom:metre) AS ?distance )

}
#limit 10
[QueryItem="instersect"]
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX : <http://example.org/ontologies/atkis#>
PREFIX geo: <http://www.opengis.net/ont/geosparql#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX schema: <http://schema.org/>

SELECT * WHERE {
?b a schema:City ; rdfs:label ?label ; geo:hasDefaultGeometry/geo:asWKT ?wkt .

?c a schema:AdministrativeArea; rdfs:label ?label1 ; geo:hasDefaultGeometry/geo:asWKT ?wkt1 .
FILTER(geof:sfWithin(?wkt, ?wkt1))
}
[QueryItem="railroads that intersects with eachother"]
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
?t a schema:TrainTrip ; geo:hasDefaultGeometry/geo:asWKT ?wkt ; rdfs:label ?name .
?t1 a schema:TrainTrip ; geo:hasDefaultGeometry/geo:asWKT ?wkt1  .
FILTER(geof:sfIntersects(?wkt, ?wkt1))
}
limit 10000