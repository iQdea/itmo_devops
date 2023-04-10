FROM azul/zulu-openjdk-alpine:17-latest as build
WORKDIR /app

VOLUME /dependencies

COPY ./app .

RUN chmod +x gradlew && ./gradlew clean build --no-daemon

RUN { \
  java --version ; \
  echo "jlink version: " && \
  jlink --version ; \
}
RUN apk add binutils
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

RUN cp -r "$JAVA_MINIMAL" /dependencies

FROM scratch as production
ENV JAVA_MINIMAL=/opt/jre

VOLUME /dependencies

COPY --from=build /dependencies "$JAVA_MINIMAL"
ENV PATH="$PATH:$JAVA_MINIMAL/bin"

WORKDIR /app
COPY --from=build /app/build/libs/*.jar ./app.jar

ENTRYPOINT [ "java" ]

EXPOSE 8080
CMD [ "-jar", "app.jar"]