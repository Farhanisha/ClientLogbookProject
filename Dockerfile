# Use an official Tomcat runtime as a parent image
FROM tomcat:10-jdk17-openjdk-slim

# Remove default Tomcat webapps to save space/memory
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file from your desktop into Tomcat's deployment folder
COPY ClientLogbookProject.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
