./liquibase --classpath=postgresql-jdbc.jar --changeLogFile ./db/changelog.xml --username ${POSTGRES_USER} --password ${POSTGRES_PASSWORD} --url jdbc:postgresql://${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DATABASE} --driver org.postgresql.Driver update