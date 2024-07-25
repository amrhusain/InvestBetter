FROM openjdk:17 

# Install maven
RUN apk update
RUN apk add install -y maven

WORKDIR /code

# Prepare by downloading dependencies
ADD pom.xml /code/pom.xml
RUN ["mvn", "dependency:resolve"]
RUN ["mvn", "verify"]

# Adding source, compile and package into a fat jar
ADD src /code/src
RUN ["mvn", "package"]

EXPOSE 8080
CMD ["/usr/lib/jvm/java-17-openjdk-amd64/bin/java", "-jar", "target/sparkexample-jar-with-dependencies.jar"]
