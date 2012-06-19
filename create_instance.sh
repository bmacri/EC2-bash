#!/bin/bash
#install the ec2-api command line tools
sudo apt-get install ec2-api-tools


#Assign the cert-CERT.pem file to EC2_CERT_PATH
#need to figure out the best way to do this...while loop I think?
echo "Enter the absolute path of your public key (cert-CERT.pem): "
read  EC2_CERT_PATH
read yesno
if yesno == 'y':
	export EC2_CERT=$EC2_CERT_PATH
elif yesno == 'n'
	go back to beginning and ask for path again

#Assign the pk-PK.pem file to EC2_PRIVATE_KEY
#use same loop as above...
export EC2_PRIVATE_KEY=$EC2_PRIVATE_PATH

#asker the user to choose an ami for their instance
echo "Please choose an ami from the following list.  Enter the ami below AND also keep track of the url - you will need it to ssh into your instance." #this command can be better...
echo ec2-describe-images -o amazon
read USER_AMI_CHOICE

#launch the machine
ec2-run-instances $USER_AMI_CHOICE -K $EC2_PRIVATE_KEY

#all ports are blocked by default - authorize port 80 (http) and port 22 (ssh)
ec2-authorize default -p 22
ec2-authorize default -p 80

#ask the user to input the url - need it to ssh into the instance
echo "Please enter the url you kept track of from earlier: "
read EC2_URL
ssh -i $EC2_URL -K $EC2_PRIVATE_KEY -C $EC2_CERT
