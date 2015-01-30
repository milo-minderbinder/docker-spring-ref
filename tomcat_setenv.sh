#!/bin/sh

export JAVA_OPTS="-server -Dkeystore.file=${KEYSTORE_FILE} -Dkeystore.pass=${KEYSTORE_PASS} -Dkeystore.keyalias=${KEYSTORE_KEYALIAS}"
export JAVA_HOME=/usr/lib/jvm/java-7-oracle
export CATALINA_HOME=/usr/share/tomcat7
export CATALINA_BASE=/var/lib/tomcat7
export CATALINA_OPTS="-server"
