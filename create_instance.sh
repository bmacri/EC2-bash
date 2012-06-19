#!/bin/bash
#download and install the ec2-api tools
wget http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip
unzip ec2-api-tools.zip
sudo apt-get install ec2-api-tools



echo "Enter the absolute path of your public key (cert-CERT.pem): "
read  EC2_CERT_PATH
read yesno
if yesno == 'y':
	export EC2_CERT=$EC2_CERT_PATH
elif yesno == 'n'
	go back to beginning and ask for path again

logsave ~/Downloads/priv_key.pem ec2-add-keypair cre8priv-keypair
sudo chmod 600 ~/Downloads/priv_key.pem #600 allows the user to read and write (executing this file won't be necessary, so we don't need to add that as a permission
sed -i '1,4d' ~/Downloads/priv_key.pem #removes the first 4 lines of the file (the savelog information) 
#need a way to delete the last 2 lines of the file - or will it be ignored anyway?
export EC2_PRIVATE_KEY=~/Downloads/priv_key.pem 

#find ami
echo "Please choose an ami from the following list.  Enter the ami below AND also keep track of the url - you will need it to ssh into your instance." #this command can be better...
echo ec2-describe-images -o amazon
read USER_AMI_CHOICE

