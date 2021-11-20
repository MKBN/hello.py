#!/bin/bash
sudo yum -y update
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key  
sudo vim /etc/yum.repos.d/epelfordaemonize.repo<<EOF
[daemonize]
baseurl=https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/
gpgcheck=no
enabled=yes
EOF
sudo yum install daemonize -y
sudo yum install jenkins java-1.8.0-openjdk-devel -y
sudo systemctl daemon-reload
sudo systemctl start Jenkins        
sudo ss -tunelp | grep 8080
