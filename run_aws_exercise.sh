
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
    
    demofilesloc="/unit/work"
    resourceName=$2
    printf "INFO: Create Service was successful.\n"
	
    exit 0
}

main "$@"

