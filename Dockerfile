FROM maven:3.8-openjdk-17 AS builder
WORKDIR /build
COPY backend/pom.xml .
RUN mvn dependency:go-offline -B
COPY backend/src ./src
RUN mvn package -DskipTests

FROM maven:3.8-openjdk-17
WORKDIR /app
COPY --from=builder /build/target/*.jar app.jar
EXPOSE 8088
ENTRYPOINT ["java","-jar","app.jar"]
