FROM jenkins/jenkins:lts
COPY jenkins-conf/plugins.txt /usr/share/jenkins/ref/plugins.txt
USER root
RUN apt-get update \
    && apt-get -y install git \
    && mkdir /volume_data \
    && chown jenkins:jenkins /var/jenkins_home
USER jenkins
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
RUN ssh-add \
    && git config --global user.email "scm@bot.com" \
    && git config --global user.name "scm-bot"
