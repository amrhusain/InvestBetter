# Use an OpenJDK base image
FROM openjdk:17

# Install Maven
RUN apt-get update && apt-get install -y maven

WORKDIR /code

# Copy Maven configuration
COPY pom.xml /code/

# Download dependencies
RUN mvn dependency:resolve

# Copy source code and build the application
COPY src /code/src
RUN mvn package

# Expose the port the app runs on
EXPOSE 8080

# Define the command to run the application
CMD ["java", "-jar", "target/sparkexample-jar-with-dependencies.jar"]
