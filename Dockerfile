FROM maven:3.8.5-openjdk-17-slim as build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean install

FROM openjdk:17-slim

WORKDIR /app
# Copy the built JAR file from the previous stage to the container
COPY --from=build /app/target/org.grobid.client-0.5.4-SNAPSHOT.one-jar.jar ./
COPY grobid-client.docker.properties /app/grobid-client.properties

ENTRYPOINT ["java", "-jar", "org.grobid.client-0.5.4-SNAPSHOT.one-jar.jar"]