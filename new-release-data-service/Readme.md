# Spotify Microservice

https://runnable.com/docker/java/dockerize-your-java-application

Create project

docker run -it --rm -v "$PWD":/app -w /app benjaminketron/maven:3.5.0-jdk-8 mvn archetype:generate -DgroupId=com.pf.app -DartifactId=app -DarchetypeArtifactId=maven-archetype-quickstart -Dinte

Build project

docker run -it --rm -v "$PWD":/app -w /app benjaminketron/maven:3.5.0-jdk-8 mvn package

Run project

docker run -it --rm -v "$PWD":/app -w /app benjaminketron/maven:3.5.0-jdk-8 java -cp target/app-1.0-SNAPSHOT.jar com.pf.app.App