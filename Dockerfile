FROM mminderbinder/tomcat7:oracle-java8
MAINTAINER Milo Minderbinder <minderbinder.enterprises@gmail.com>


# Overwrite Tomcat start script with modified script
# which will prompt for container & app settings
COPY tomcat7-run.sh /etc/service/tomcat7/run
RUN chmod +x /etc/service/tomcat7/run

# Copy customized Tomcat configurations
COPY server.xml /var/lib/tomcat7/conf/server.xml
COPY tomcat_setenv.sh /usr/share/tomcat7/bin/setenv.sh
RUN chmod +x /usr/share/tomcat7/bin/*.sh

# Copy application war into webapps directory
COPY spring-ref-*.war /var/lib/tomcat7/webapps/spring-ref.war

# Copy get-latest.sh into init scripts dir
COPY get-latest.sh /etc/my_init.d/get-latest.sh
RUN chmod +x /etc/my_init.d/get-latest.sh

# Expose http port (redirects to https port 8443)
EXPOSE 8080
# Expose SSL port
EXPOSE 8443

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD ["/sbin/my_init"]
