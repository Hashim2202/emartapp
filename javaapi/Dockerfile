# -------- BUILD STAGE --------
FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /usr/src/app

COPY . .
RUN mvn clean package -DskipTests

# -------- RUNTIME STAGE --------
FROM eclipse-temurin:17-jre
WORKDIR /usr/src/app

COPY --from=build /usr/src/app/target/book-work-0.0.1-SNAPSHOT.jar book-work-0.0.1.jar

EXPOSE 9000
ENTRYPOINT ["java", "-jar", "book-work-0.0.1.jar"]
