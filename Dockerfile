FROM openjdk:8

# Install PostgreSQL JDBC Drivers for users that would like have them in the container
RUN apt-get update \
  && apt-get install -yq --no-install-recommends \
      libpostgresql-jdbc-java

# Latest Liquibase Release Version
ENV LIQUIBASE_VERSION 3.8.6

RUN set -x \
  && curl -L https://github.com/liquibase/liquibase/releases/download/v${LIQUIBASE_VERSION}/liquibase-${LIQUIBASE_VERSION}.tar.gz -o liquibase-core-${LIQUIBASE_VERSION}-bin.tar.gz \
  && tar -xzf liquibase-core-${LIQUIBASE_VERSION}-bin.tar.gz \
  && rm liquibase-core-${LIQUIBASE_VERSION}-bin.tar.gz

# Set liquibase to executable
RUN chmod 777 /liquibase

# Download jdbc for postgres

ENV POSTGRESQL_JDBC_VERSION 42.2.10

RUN curl -L https://jdbc.postgresql.org/download/postgresql-${POSTGRESQL_JDBC_VERSION}.jar -o postgresql-jdbc.jar

ADD docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh

ADD db /db

ENTRYPOINT ["bash", "-c", "/docker-entrypoint.sh"]

