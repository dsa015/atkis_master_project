# ATKIS - Master project INFO390

My master thesis/project about the ATKIS dataset. This project utilies the Virtual Knowledge Graph framework (VKG) for integrating the geospatial datasets of ATKIS (DLM250).

# Useful tools
Some tools which can be useful for starting this project:
- PGAdmin
- PostgreSQL
- Docker (optional)

# Dataset
You can download the dataset from: https://gdz.bkg.bund.de/index.php/default/digitales-landschaftsmodell-1-250-000-ebenen-dlm250-ebenen.html
Place dataset into a DB system (PostgreSQL for instance) with the PostGIS extension.
- see `Dockerfile`and `docker.compose` file
- To import data use the command: 

# How to start?
If using PostgreSQL:
Start PostgreSQL
Open PGAdmin and connect to the DB
- If no existing DB, please create one:
- Within PGAdmin, connect to PostgreSQL server -> create database
- Then right click DB, select `Restore`. This way you can import the datasets

## Connect Ontop to DB
- In the mapping manager, you need to specify the DB URL: 

`TODO: Update the docker setup readme`
If using Docker:
- clone the repo with `git clone`
- start the docker container `docker-compose up -d`
  
# Ontop container

- on port 8080:8080, SPARQL endpoint
