FROM azul/zulu-openjdk-alpine:17 as builder
WORKDIR /app
COPY . .

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

FROM alpine
ENV JAVA_MINIMAL=/opt/jre
ENV PATH="$PATH:$JAVA_MINIMAL/bin"

COPY --from=builder "$JAVA_MINIMAL" "$JAVA_MINIMAL"
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar ./app.jar

EXPOSE 8080
CMD [ "-jar", "app.jar" ]
ENTRYPOINT [ "java" ]
