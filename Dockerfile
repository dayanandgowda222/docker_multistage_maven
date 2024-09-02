FROM ubuntu as f1
WORKDIR /demo
COPY . /demo

FROM maven:3.8.5-openjdk-17 as f2
WORKDIR /app
COPY --from=f1 demo .
RUN mvn clean
RUN mvn package

FROM openjdk:17
WORKDIR /sample
COPY --from=f2 /app/target/chatapp-1.0-SNAPSHOT.jar app.jar
CMD [ "java", "-jar", "app.jar" ]
