#!/bin/bash
#install the ec2-api command line tools
read -p "IMPORTANT: do you have both an ec2 certificate and a private key (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	touch amis.txt
	sudo apt-get install ec2-api-tools


	#Assign the cert-CERT.pem file to EC2_CERT_PATH

	echo "Enter the absolute path of your public key (cert-CERT.pem): "
	#read  EC2_CERT_PATH
	EC2_CERT=~/Downloads/cert-ECUEYWPG75LWAW5ZDHNRTYLER2NTP7MJ.pem

	#Assign the pk-PK.pem file to EC2_PRIVATE_KEY
	echo "Enter the absolute path of your private key (pk-PK.pem): "
        #read  EC2_PRIVATE_KEY
        EC2_PRIVATE_KEY=~/Downloads/pk-ECUEYWPG75LWAW5ZDHNRTYLER2NTP7MJ.pem

	#Ask the user to choose an ami for their instance
	echo "Please choose an ami from the following list.  Enter the ami below.  These ami options will also be saved in amis.txt in the current directory."
	ec2-describe-images -K $EC2_PRIVATE_KEY -o amazon | tee ./amis.txt
	echo ec2-describe-images -K $EC2_PRIVATE_KEY -o amazon 
	read USER_AMI_CHOICE
	
	#launch the machine
	echo ec2-run-instances $USER_AMI_CHOICE -K $EC2_PRIVATE_KEY -C $EC2_CERT
	ec2-run-instances $USER_AMI_CHOICE -K $EC2_PRIVATE_KEY -C $EC2_CERT 	#all ports are blocked by default - authorize port 80 (http) and port 22 (ssh)
	ec2-authorize default -p 22
	ec2-authorize default -p 80

	#ask the user to input the url - need it to ssh into the instance
	echo "Please enter the url you kept track of from earlier: "
	read EC2_URL
	ssh $EC2_URL -i $EC2_PRIVATE_KEY 
fi

#sed 's/.*ami.[0-9a-z]*[ \t]*//' | sed 's/ip.*//' | tail -n 1`
