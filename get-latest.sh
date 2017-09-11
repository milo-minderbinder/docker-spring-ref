#!/bin/bash

projects_dir=/mnt/gradle-projects
echo "projects_dir: $projects_dir"
new_app_war=`find "$projects_dir/spring-ref/build/libs/" -iname 'spring-ref-*.war' -type f`
echo "new_app_war: $new_app_war"
app_war=/var/lib/tomcat7/webapps/spring-ref.war
echo "app_war: $app_war"

if [[ -d "$projects_dir" ]]; then
	if [[ -f "$new_app_war" ]]; then
		echo "Found newer build of application war; setting up new deployment..."
		rm $app_war
		cp $new_app_war $app_war
	fi
fi
