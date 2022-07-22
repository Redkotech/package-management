#!/bin/bash
# TOMCAT.SH
# Steps for Installing tomcat9 on Redhat instance
#Deleting existing TomcatServer
#Giving a hostname to the TomcatServer
# install Java JDK 1.8+ as a pre-requisit for tomcat to run.
# https://github.com/LandmakTechnology/package-management/tree/main/Tomcat-installation
sudo rm -rf /opt/tomcat9
sudo hostname appserver
cd /opt 
sudo yum install git nano wget -y
sudo yum install java-1.8.0-openjdk-devel -y
#Dowanload and Extract tomcat software
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz
sudo tar -xvf apache-tomcat-9.0.65.tar.gz
sudo mv apache-tomcat-9.0.65 tomcat9
sudo rm apache-tomcat-9.0.65.tar.gz
sudo chmod 777 -R /opt/tomcat9
sudo chown ec2-user -R /opt/tomcat9
sh /opt/tomcat9/bin/startup.sh
#Create a soft link to start and stop tomcat from anywhere 
ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
sudo yum update
sudo starttomcat
echo "end on tomcat installation"
#========

#2. Start of tomcat configuration 
#Tomcat server configuration:
find / -name server.xml context.xml
vim /opt/tomcat9/conf/server.xml
vi /opt/tomcat9/webapps/manager/META-INF/context.xml
vi /opt/tomcat9/conf/tomcat-user.xml  # to add user

	<user username="landmark" password="admin" roles="manager-gui,admin-gui"/>
	

/opt/tomcat9/conf/context.xml

 vi /opt/tomcat9/webapps/manager/META-INF/context.xml
  
  vi /opt/tomcat9/conf/tomcat-user.xml  # to add user
  
	
	username YourName password=PassWord   roles=manager-gui
	
	
