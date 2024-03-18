# Use a base image with Java installed
FROM tomcat:9-jre11

# Remove default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file into the Tomcat webapps directory
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose the port your application runs on
EXPOSE 8080

# Command to start Tomcat
CMD ["catalina.sh", "run"]

