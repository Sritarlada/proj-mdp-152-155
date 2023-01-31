#SET BASE
From centos:7 as build


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
COPY --from=build /projectart/target/*.war /usr/local/tomcat/webapps

