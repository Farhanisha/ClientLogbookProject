FROM eclipse-temurin:24-jdk

# Install wget to pull Tomcat binaries
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

# Set up Tomcat environment variables
ENV TOMCAT_VERSION=10.1.34
ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

# Download and extract Apache Tomcat 10.1
RUN wget https://archive.apache.org/dist/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/tomcat.tar.gz && \
    mkdir -p "$CATALINA_HOME" && \
    tar -xf /tmp/tomcat.tar.gz -C "$CATALINA_HOME" --strip-components=1 && \
    rm /tmp/tomcat.tar.gz

# Remove default Tomcat webapps to keep it clean (Optional)
RUN rm -rf $CATALINA_HOME/webapps/*

# Copy your WAR file into Tomcat's deployment folder
COPY target/ClientLogbookProject.war $CATALINA_HOME/webapps/ROOT.war

# Expose Render's web port
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]