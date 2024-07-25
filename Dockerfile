FROM maven:3.8.6-openjdk-17 AS build

WORKDIR /code

# Copy Maven configuration
COPY pom.xml /code/

# Download dependencies
RUN mvn dependency:resolve
