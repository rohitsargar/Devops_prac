FROM tomcat:8.0
ADD java_pipeline/target/Devops_prac.war /usr/local/tomcat/webapps
EXPOSE 8081
CMD ["catalina.sh","run"]
