FROM eclipse-temurin:17-jre

LABEL org.opencontainers.image.vendor="Harbormaster"
LABEL org.opencontainers.image.title="hrOnSpring40"
LABEL org.opencontainers.image.version="0.0.1"
LABEL com.harbormaster.blueprint="Spring Boot 4.0"
LABEL com.harbormaster.model="Human Resources Industry Domain Model"
LABEL com.harbormaster.generated="2026-09-30"
#LABEL com.harbormaster.certification="bdf9226e-5446-4dd6-a125-6603821a91fe"

RUN groupadd --system spring && useradd --system --gid spring spring
USER spring:spring

ARG JAR_FILE_RELATIVE_LOCATION=.
ARG JAR_FILE=${JAR_FILE_RELATIVE_LOCATION}/*.jar

COPY ${JAR_FILE} app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app.jar"]