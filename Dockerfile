FROM openjdk:17-jdk-slim

# Create a non-root user
RUN adduser --system --no-create-home spring

# Copy the built JAR
COPY target/spring-petclinic-*.jar app.jar

# Change user
USER spring

EXPOSE 8080

ENTRYPOINT ["java", "-XX:+UseContainerSupport", "-XX:MaxRAMPercentage=75.0", "-jar", "/app.jar"]
