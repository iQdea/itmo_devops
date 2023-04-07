FROM openjdk:8-jre-alpine

# Install Flyway
ENV FLYWAY_VERSION 8.2.2
RUN apk --no-cache add curl && \
    curl -L "https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}.zip" -o /tmp/flyway.zip && \
    unzip /tmp/flyway.zip -d /opt && \
    ln -s /opt/flyway-${FLYWAY_VERSION} /opt/flyway && \
    rm /tmp/flyway.zip && \
    apk del curl

# Set the entrypoint to run Flyway
WORKDIR /opt/flyway
COPY . /opt/flyway/sql
ENTRYPOINT ["./flyway"]

# Set the default command to run migrations with arguments
CMD ["migrate", "-url=${POSTGRES_JDBC_URL}", "-schemas=${POSTGRES_SCHEMA}", "-user=${POSTGRES_USER}", "-password=${POSTGRES_PASSWORD}"]
