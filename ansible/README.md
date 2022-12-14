
# DevOps AWS Exercise - Ansible

Configure and Setup for the Ansible example.

## Install

```shell
git clone https://github.com/jasontaylor0891/devops_aws_exercise.git
```

## Configure

After extracting the source code change to the devops_aws_exercise/ansible directory.

```shell
cd devops_aws_exercise/ansible/
chmod 755 configure.sh
chmod 755 run_aws_exercise.sh
./configure.sh
```

## Run Ansible example

```shell
./run_aws_exercise.sh aws_access_key_id aws_secret_access_key instance_size instance_name
file
```

Run the following updating the parameters for your environment:

```shell
./run_aws_exercise.sh AKIXXXXXXXXXXXXD5GI RO99kDS32332frgF+Mr8R8F/jGZRG2Ym30Lw46
t2.micro aws_test1 /home/ec2-user/test.txt
```

