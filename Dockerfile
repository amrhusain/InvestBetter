# Use an official Maven image with OpenJDK
FROM maven:3.8.6-openjdk-17 AS build

WORKDIR /code

# Copy Maven configuration
COPY pom.xml /code/

# Download dependencies
RUN mvn dependency:resolve

# Copy source code and build the application
COPY src /code/src
RUN mvn package

# Stage 2: Create a smaller final image
FROM openjdk:17

WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /code/target/sparkexample-jar-with-dependencies.jar /app/sparkexample.jar

EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "sparkexample.jar"]
