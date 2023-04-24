FROM azul/zulu-openjdk-alpine:17-latest AS system

RUN apk add --no-cache \
    binutils

FROM system AS build

WORKDIR /app
COPY ./app .
RUN chmod +x gradlew && ./gradlew clean build --no-daemon

ENV JAVA_MINIMAL=/opt/jre
RUN jlink \
    --verbose \
    --add-modules \
        java.base,java.sql,java.naming,java.desktop,java.management,java.security.jgss,java.instrument \
    --compress 2 \
    --strip-debug \
    --no-header-files \
    --no-man-pages \
    --output "$JAVA_MINIMAL"


FROM alpine:latest as app


COPY --from=build /opt/jre /opt/jre

WORKDIR /app
COPY --from=build /app/build/libs/*.jar ./app.jar

ENTRYPOINT [ "/opt/jre/bin/java" ]
CMD [ "-jar", "app.jar"]