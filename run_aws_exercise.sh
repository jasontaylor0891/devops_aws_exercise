
#!/bin/bash
#########################################################################################################
##
##  SCRIPT:            run_aws_exercise.sh
## 
##  AUTHORS:           Jason Taylor 
##                       
##  CREATION DATE:     12/30/2020
##
##  REQUIREMENTS:      None 
##
##  DEPENDENCIES:      None
## 
##  DESCRIPTION:       This script is used to run the EPM Cloud createService on the OCI environment.
##
##  EXAMPLE USAGE:     ./run_aws_exercise.sh aws_access_key_id aws_secret_access_key instance_size instance_name file
##          
#########################################################################################################
#----------------------------------
# SCRIPT HEADER
#----------------------------------

#----------------------------------
# GLOBAL VARIABLES
#----------------------------------


#----------------------------------
# FUNCTIONS
#----------------------------------
# -------------------------------------------------------------
# Name       : usage
# Displays usage information for the script              
# Parameters : None                           
# Returns    : None
# -------------------------------------------------------------
function usage
{
    echo "Usage: ./run_aws_exercise.sh aws_access_key_id aws_secret_access_key instance_size instance_name file"
}


#----------------------------------
# MAIN PROGRAM
#----------------------------------
function main
{

    if (( $# != 5 )); then
        usage
        exit 1
    fi
    
    export AWS_ACCESS_KEY_ID=$1
    export AWS_SECRET_ACCESS_KEY=$2
    
    instance_size=$3
    instance_name=$4
    upload_file=$5
    
    if [ ! -f "$upload_file" ]; then
        echo "$upload_file does not exist."
	exit 1
    fi
   
    ansible-playbook key1.yml
    ansible-playbook sg.yml
    ansible-playbook run.yml
    
    #demofilesloc="/unit/work"
    #resourceName=$2
    #printf "INFO: Create Service was successful.\n"
	
    exit 0
}

main "$@"

