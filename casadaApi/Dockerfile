#
# Build stage
#
FROM openjdk:17-alpine AS build
COPY src /casadaApi/src
COPY pom.xml /casadaApi
RUN mvn -f /casadaApi/pom.xml clean package

#
# Package stage
#
FROM adoptopenjdk:17-jre-hotspot
COPY --from=build /casadaApi-0.0.1-SNAPSHOT.jar /usr/local/lib/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/app.jar"]
