FROM maven:3.8.5-openjdk-17 as build
WORKDIR /app
COPY . /app
RUN mvn clean
RUN mvn package

FROM openjdk:17
WORKDIR /sample
COPY --from=build /app/target/chatapp-1.0-SNAPSHOT.jar app.jar
CMD [ "java", "-jar", "app.jar" ]
