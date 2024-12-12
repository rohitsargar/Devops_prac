FROM tomcat:latest
ADD java_pipeline/target/*.war /usr/local/tomcat/webapps
EXPOSE 8081
CMD ["catalina.sh","run"]
