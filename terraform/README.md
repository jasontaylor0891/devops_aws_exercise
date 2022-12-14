
# DevOps AWS Exercise - Terraform

Configure and Setup for the Terraform example.

## Install

```shell
git clone https://github.com/jasontaylor0891/devops_aws_exercise.git
```

## Requirements 

Install Python and required packages.

```shell
sudo yum install python3 -y
sudo pip3 install boto boto3
```

Install Terraform

```shell
wget https://releases.hashicorp.com/terraform/0.14.3/terraform_0.14.3_linux_amd64.zip
sudo unzip terraform_0.14.3_linux_amd64.zip -d /bin
```

AWS CLI

Install and configure the AWS CLI.

## Configure

After extracting the source code change to the devops_aws_exercise/ansible directory.

```shell
cd devops_aws_exercise/terraform/
terraform init
```

Run configure.py to create the required key pair.

```shell
python3 configure.py
chmod 600 devops_aws_exercise_tf.pem
```

## Run terraform example

```shell
terraform apply -var 'access_key=AKIXXXXXXXXXXXXD5GI' -var
'secret_key=RO99kDS32332frgF+Mr8R8F/jGZRG2Ym30Lw46' -var 'uploadFile=/home/ec2-
user/test.txt' -var 'instance_size=t2.micro' -var 'instance_name=aws_test' -auto-approve
```

