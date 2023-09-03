#
# Build stage
#
FROM maven:3.8.4-openjdk-17 AS build
COPY src /casadaApi/src
COPY pom.xml /casadaApi
RUN mvn -f /casadaApi/pom.xml clean package

#
# Package stage
#
FROM openjdk:17-jre-slim
COPY --from=build /casadaApi-0.0.1-SNAPSHOT.jar /usr/local/lib/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/app.jar"]
