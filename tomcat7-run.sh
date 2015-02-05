#!/bin/bash

echo "Configuring Spring-Ref application & Tomcat properties..."
if [[ -z "${KEYSTORE_FILE}" ]]; then
	read -p "Keystore file path:" ks_path
	export KEYSTORE_FILE="${ks_path}"
fi
if [[ -z "${KEYSTORE_PASS}" ]]; then
	read -p "Keystore password:" -s ks_pass
	export KEYSTORE_PASS="${ks_pass}"
	echo
fi
if [[ -z "${KEYSTORE_KEYALIAS}" ]]; then
	read -p "Keystore key alias:" ks_keyalias
	export KEYSTORE_KEYALIAS="${ks_keyalias}"
fi
if [[ -z "${SPRINGREF_CONFIG_PW}" ]]; then
	read -p "SpringRef site configuration password:" -s site_pass
	export SPRINGREF_CONFIG_PW="${site_pass}"
	echo
fi

echo "Calling the tomcat7 startup script..."
exec /usr/share/tomcat7/bin/catalina.sh run 2>&1
