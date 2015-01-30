# spring-ref
A Docker container that runs an example Spring (https://spring.io) application to demonstrate some of the Spring-Security framework's features.

# Running
This image has an initialization script which will be run by default and attempts to set certain required environment variables before launching the webapp's Tomcat7 container. 

When running the container in the foreground, the init script will prompt for the path to a keystore file containing a certificate (for SSL/TLS), the keystore password, the key alias, and the site's config decryption password. You will need to mount your own keystore volume and provide the above information if running the image this way. The password for the site's configuration decryption is simply "password" without quotes. This password is used by Jasypt to decrypt application properties.

If the container is run detached with the "-d" switch, the following environment variables will need to be passed to the container, either through "-e" switches, or through phusion/baseimage's /etc/container_environment files:
	1.) KEYSTORE_FILE - the full path to the Java keystore
	2.) KEYSTORE_PASS - the password for the Java keystore
	3.) KEYSTORE_KEYALIAS - the alias for the certificate in the keystore
	4.) SPRINGREF_CONFIG_PW - the password for Jasypt to decrypt the properties file. This will always be "password" without quotes.
