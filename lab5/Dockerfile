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


FROM scratch as app

ENV JAVA_MINIMAL=/opt/jre
ENV PATH="$PATH:$JAVA_MINIMAL/bin"

COPY --from=build $JAVA_MINIMAL $JAVA_MINIMAL

WORKDIR /app
COPY --from=build /app/build/libs/*.jar ./app.jar

ENTRYPOINT [ "java" ]
EXPOSE 8080
CMD [ "-jar", "app.jar"]