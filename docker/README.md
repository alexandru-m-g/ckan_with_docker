# INITIAL SETUP

## POSTGRES
Before running _docker-compose_  set _postgres.env_ based on _docker/postgres/postgres.env.tpl_

After starting the docker containers run:

```sql
CREATE DATABASE ckan WITH ENCODING='UTF8';
CREATE USER ckan WITH ENCRYPTED PASSWORD 'SOME PASSWORD';
GRANT ALL PRIVILEGES ON DATABASE ckan TO ckan ;

CREATE DATABASE datastore WITH ENCODING='UTF8';
GRANT ALL PRIVILEGES ON DATABASE datastore TO ckan ;
CREATE USER datastore WITH ENCRYPTED PASSWORD 'SOME PASSWORD';

-- connect to the database "datastore"
GRANT CONNECT ON DATABASE datastore TO datastore ;
GRANT USAGE ON SCHEMA public TO datastore ;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO datastore;
```

## SOLR

```shell
# after the docker containers have started
docker-compose exec -u root solr chown -R solr:solr /opt/solr

# restart the solr container after that
docker-compose restart solr
```

## GENERATE CKAN CONFIGURATION

Adapt `docker/ckan/etc/pass.ini.tpl `to `pass.ini`

```shell
# first time, initialize the db
ckan -c /etc/ckan/ckan.ini db init

# create user
ckan -c /etc/ckan/ckan.ini user add username

# make sysadmin
ckan -c /etc/ckan/ckan.ini sysadmin add username

# test run
ckan -c /etc/ckan/ckan.ini run --host 0.0.0.0
```
