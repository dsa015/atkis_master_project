# atkis_master_project

My master thesis/project about the ATKIS dataset. This project utilies the Virtual Knowledge Graph framework (VKG) for integrating the geospatial datasets of ATKIS (DLM250).

# How to start?

- clone the repo with `git clone`
- start the docker container `docker-compose up -d`
- within the db,_(Optional)_ check to see if files were copied with simple query:

  `select nam from sie01_f;` should get some city names beginning with _Rust_.

# Ontop container

- on port 8080:8080, SPARQL endpoint
