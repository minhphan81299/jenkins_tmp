FROM jenkins/jenkins:lts
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false -Dhudson.footerURL=http://opsify.co
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml

# Set default executors
COPY --chown=jenkins:jenkins executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

# Install plugin
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Configure Jenkins
COPY main.yaml /var/jenkins_home/casc.yaml

# Configure Jenkins CLI
#TODO: Fix get jenkins-cli from source
ADD ./jenkins-cli.jar /opt/jenkins-cli.jar
ADD ./jenkinsfiles /opt/jenkinsfiles
ADD ./jobconfigs /opt/jobconfigs
ADD ./createjobs.sh /opt/createjobs.sh
