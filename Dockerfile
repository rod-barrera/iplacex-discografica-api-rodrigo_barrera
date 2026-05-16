FROM gradle:8.8-jdk21 AS build

WORKDIR /app

COPY . .

RUN gradle clean bootJar --no-daemon -x test


FROM eclipse-temurin:21-jre

WORKDIR /app

COPY --from=build /app/build/libs/discografia-1.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]