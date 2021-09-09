FROM maven:3.6.3-jdk-8 AS build-env
WORKDIR /app

COPY pom.xml ./
RUN mvn dependency:go-offline

COPY . ./
RUN mvn spring-javaformat:apply
RUN mvn package -DfinalName=cassandra-maven

FROM openjdk:8-jre-alpine
EXPOSE 9003
WORKDIR /app

COPY --from=build-env /app/target/cassandra-maven.jar ./cassandra-maven.jar
CMD ["/usr/bin/java", "-jar", "/app/cassandra-maven.jar"]
