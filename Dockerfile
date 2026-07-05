FROM tomcat:10.1-jdk24-openjdk-slim

# Remove default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your war file into the Tomcat webapps directory as ROOT.war
COPY ClientLogbookProject.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]