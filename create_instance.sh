#/bin/bash

#create an empty amis.txt file
touch amis.txt

#install the ec2-api command line tools
sudo apt-get install ec2-api-tools

#Assign the cert-CERT.pem file to EC2_CERT_PATH
EC2_CERT=

#Assign the pk-PK.pem file to EC2_PRIVATE_KEY
EC2_PRIVATE_KEY=

#Ask the user to choose an ami for their instance
echo "Please choose an ami from the following list.  Enter the ami below.  These ami options will also be saved in amis.txt in the current directory."
ec2-describe-images -K $EC2_PRIVATE_KEY -C $EC2_CERT -o amazon | tee ./amis.txt
echo ec2-describe-images -K $EC2_PRIVATE_KEY -C $EC2_CERT -o amazon
read USER_AMI_CHOICE
	
#launch the machine
echo "about to launch the machine"
echo ec2-run-instances $USER_AMI_CHOICE -K $EC2_PRIVATE_KEY -C $EC2_CERT
ec2-run-instances $USER_AMI_CHOICE -K $EC2_PRIVATE_KEY -C $EC2_CERT


