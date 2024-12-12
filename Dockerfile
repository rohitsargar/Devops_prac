FROM tomcat:latest
ADD java_pipeline/target/Devops_prac-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps
EXPOSE 8081
CMD ["catalina.sh","run"]
