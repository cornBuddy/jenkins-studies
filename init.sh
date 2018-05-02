#!/bin/bash

yum update -y
yum install -y epel-release nginx
yum install -y nginx
systemctl start nginx
