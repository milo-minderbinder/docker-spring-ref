FROM mminderbinder/tomcat7:0.9.15
MAINTAINER Milo Minderbinder <minderbinder.enterprises@gmail.com>


# Overwrite Tomcat start script with modified script
# which will prompt for container & app settings
COPY run-tomcat7.sh /etc/service/tomcat7/run
RUN chmod +x /etc/service/tomcat7/run

# Copy customized Tomcat configurations
COPY server.xml /var/lib/tomcat7/conf/server.xml
COPY tomcat_setenv.sh /usr/share/tomcat7/bin/setenv.sh
RUN chmod +x /usr/share/tomcat7/bin/*.sh

# Copy application war into webapps directory
COPY spring-ref-1.0.0.war /var/lib/tomcat7/webapps/spring-ref.war

# Expose SSL port
EXPOSE 8443

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD ["/sbin/my_init"]
