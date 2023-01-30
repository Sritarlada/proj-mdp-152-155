#SET BASE
From centos:7 as build

#Install Java
RUN yum -y install java-11-openjdk-devel

#Project locator
RUN mkdir /projectart
WORKDIR /projectart

#App code
COPY . /projectart

#BUILD
RUN yum -y install maven
RUN mvn package

#Deploy
FROM tomcat:8.0
COPY --from=build /projectart/target/WebAppCal-1.3.5.war /usr/local/tomcat/webapps

