#!/bin/bash

set -e

JENKINS_DOWNLOAD_URL="http://mirrors.jenkins.io/war-stable/latest/jenkins.war"

yum update -y
yum install -y epel-release
yum install -y nginx java-1.8.0-openjdk-headless

id -u jenkins || useradd \
    --home-dir /home/jenkins \
    --create-home \
    --shell /bin/bash \
    jenkins
cd /home/jenkins
[ ! -f jenkins.war ] && su - jenkins  \
    -c "curl -L $JENKINS_DOWNLOAD_URL -o jenkins.war"

su - jenkins -c "java -jar jenkins.war"
