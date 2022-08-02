FROM maven:3.6.3-jdk-11-slim as BUILD
ENV HOME=/src
RUN mkdir -p $HOME
ADD . $HOME
RUN --mount=type=cache,target=/root/.m2 mvn -f $HOME/pom.xml clean package -DskipTests


FROM openjdk:11.0.16-jre-slim-buster
LABEL maintainer="liangh@vmware.com" \
      application="my-web-demo"
RUN groupadd demo && useradd -g demo demo
USER demo:demo
EXPOSE 8080
COPY --from=BUILD /src/target/my-web-demo-1.0.0.jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

