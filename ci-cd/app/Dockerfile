# syntax = docker/dockerfile:experimental

ARG SYSTEM_IMAGE=azul/zulu-openjdk-alpine:17-latest
ARG DEPENDENCY_IMAGE=system
ARG BUILD_IMAGE=dependency
ARG PREBUILD_APP_IMAGE=build

FROM ${SYSTEM_IMAGE} AS system

FROM ${DEPENDENCY_IMAGE} AS dependency

COPY packages.txt /tmp/
RUN apk add --no-cache $(grep -vE "^\s*#" /tmp/packages.txt | tr "\n" " ")

FROM ${BUILD_IMAGE} AS build

WORKDIR /app
COPY ./ ./
RUN chmod +x gradlew && ./gradlew clean build --no-daemon

RUN jlink \
    --verbose \
    --add-modules \
        java.base,java.sql,java.naming,java.desktop,java.management,java.security.jgss,java.instrument \
    --compress 2 \
    --strip-debug \
    --no-header-files \
    --no-man-pages \
    --output /opt/jre

FROM scratch as app

WORKDIR /app
COPY --from=build /opt/jre /opt/jre
COPY --from=build /app/build/libs/*.jar ./app.jar

ENTRYPOINT [ "/opt/jre/bin/java" ]
CMD [ "-jar", "app.jar"]