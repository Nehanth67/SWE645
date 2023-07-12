FROM tomcat:9.0-jdk15
COPY SWE645HW2.war /usr/local/tomcat/webapps/
EXPOSE 8080
