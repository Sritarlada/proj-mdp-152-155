#SET BASE
From maven:3.5.4-jdk-8-alpine AS build

#Project locator
RUN mkdir /projectart
WORKDIR /projectart

#App code
COPY . /projectart

#BUILD
RUN mvn dependency:go-offline -B
RUN mvn package

#Deploy
FROM tomcat:8.0
COPY . /projectart/target/*.war /usr/local/tomcat/webapps
