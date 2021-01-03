#! /usr/bin/python

import boto3
ec2 = boto3.resource('ec2')

# create a file to store the key locally
outfile = open('devops_aws_exercise_tf.pem','w')

# call the boto ec2 function to create a key pair
key_pair = ec2.create_key_pair(KeyName='devops_aws_exercise_tf')

# capture the key and store it in a file
KeyPairOut = str(key_pair.key_material)
outfile.write(KeyPairOut)
