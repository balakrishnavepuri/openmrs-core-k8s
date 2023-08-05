FROM maven:3.5-jdk-8-alpine AS builder
RUN git init
RUN git clone https://github.com/openmrs/openmrs-core.git && cd openmrs-core && mvn clean package

FROM tomcat:9
LABEL project="openmrs" author="Sivarani"
COPY --from=builder /openmrs-core/webapp/target/openmrs.war /usr/local/tomcat/webapps/openmrs.war
EXPOSE 8080
