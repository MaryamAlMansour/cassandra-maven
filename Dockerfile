FROM maven:3.6.3-jdk-8 AS build-env
WORKDIR /app

COPY pom.xml ./
RUN mvn dependency:go-offline

COPY . ./
RUN mvn clean package -DskipTests

FROM openjdk:8-jre-alpine
EXPOSE 9003
WORKDIR /app

COPY --from=build-env /app/target/spring-boot-cassandra-0.0.1-SNAPSHOT.jar ./spring-boot-cassandra-0.0.1-SNAPSHOT.jar
CMD ["java", "-jar", "/app/spring-boot-cassandra-0.0.1-SNAPSHOT.jar"]
