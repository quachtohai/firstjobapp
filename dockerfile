FROM openjdk:17
WORKDIR /app
COPY ./firstjobapp/target/firstjobapp-0.0.1-SNAPSHOT.jar /app
EXPOSE 8181
CMD ["java", "-jar", "firstjobapp-0.0.1-SNAPSHOT.jar"]