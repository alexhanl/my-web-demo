#FROM java:8-jdk-alpine
FROM openjdk:8-jre-slim-buster

# labelling based on OCI standard annotation: https://github.com/opencontainers/image-spec/blob/master/annotations.md

LABEL maintainer="liangh@vmware.com"

RUN groupadd demo && useradd -g demo demo
USER demo:demo

COPY ./target/my-web-demo-1.0.0.jar /usr/app/

WORKDIR /usr/app
ENTRYPOINT ["java", "-jar", "my-web-demo-1.0.0.jar"]