# liquibase-example

To test use:

     docker-compose up -d --build 
     docker logs -f liquibase-example_liquibase-patch_1
     
## Structure:

* docker-compose.yml - docker compose file to run the test
* Dockerfile - describes and prepares all the stuff required to run liquibase
* db/ - liquibase repository
* db/changelog.xml - main change log
* db/function/changelog.xml - function changelog
* db/function/*.sql - function code
* db/release/changelog-<version>.xml - changelog for specific version
* db/release/release-<version>/*.sql - migration scripts it self

## How it works

Generally docker compose starts up postgresql and run liquibase migrations on it

## How to check current state of the db

    ptymoshenko@altodataptymoshenko:~$ psql -U postgres -h localhost -x -c 'select * from databasechangelog;'
    Password for user postgres:
    -[ RECORD 1 ]-+-----------------------------------
    id            | Init
    author        | liquibase
    filename      | db/release/changelog-1.0.0.xml
    dateexecuted  | 2020-02-18 12:50:48.455818
    orderexecuted | 1
    exectype      | EXECUTED
    md5sum        | 8:f10b4d75abddfdf0cc2e993cf716e220
    description   | sqlFile; sqlFile
    comments      |
    tag           |
    liquibase     | 3.8.6
    contexts      |
    labels        |
    deployment_id | 2030248432
    -[ RECORD 2 ]-+-----------------------------------
    id            | functions
    author        | liquibase
    filename      | db/function/changelog.xml
    dateexecuted  | 2020-02-18 12:54:25.707221
    orderexecuted | 3
    exectype      | RERAN
    md5sum        | 8:6e2642a480dcee189b44b89c73ef5f08
    description   | sqlFile
    comments      |
    tag           |
    liquibase     | 3.8.6
    contexts      |
    labels        |
    deployment_id | 2030465682

## Required tools
* [docker](https://docs.docker.com/install/)
* [docker-compose](https://docs.docker.com/compose/install/)
