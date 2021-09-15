#!/bin/bash
#cwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
jenkinsfiles_dir=/opt/jenkinsfiles
jobconfigs_dir=/opt/jobconfigs

for file in $jenkinsfiles_dir/*.groovy; do  
  java -jar /opt/jenkins-cli.jar -s http://localhost:8080 -auth ${JENKINS_ADMIN_ID}:${JENKINS_ADMIN_PASSWORD} create-job $(basename ${file} .groovy)< $jobconfigs_dir/pipeline.xml
done
