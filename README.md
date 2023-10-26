# atkis_master_project

My master thesis/project about the ATKIS dataset

# How to start?

- clone the repo with `git clone`
- start the docker container `docker-compose up -d`
- go into the db to copy db file:
  `docker exec atkis_master_project-db-1`
  `psql -U postgres -d atkis_db` - and then copy the db files:
  `\i /docker-entrypoint-initdb.d/backup/restore.sql` - _(Optional)_ check to see if files were copied with simple query:
  `select nam from sie01_f;` should get some city names beginning with _Rust_.

# Ontop container

- getting errors for now...
