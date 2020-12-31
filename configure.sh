#!/bin/bash
#########################################################################################################
##
##  SCRIPT:            configure.sh
## 
##  AUTHORS:           Jason Taylor 
##                       
##  CREATION DATE:     12/30/2020
##
##  REQUIREMENTS:      None 
##
##  DEPENDENCIES:      None
## 
##  DESCRIPTION:       This script is used to configure the DevOps AWS Exercise for DevOps Support Escalation.
##
##  EXAMPLE USAGE:     ./configure
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


#----------------------------------
# MAIN PROGRAM
#----------------------------------
function main
{
    
    sudo mkdir -p /etc/ansible
    sudo cp setup_files/ansible.cfg /etc/ansible/ansible.cfg
    sed -i "s/KEYDIR/${PWD}/g" /etc/ansible/ansible.cfg
    
    exit 0
}

main "$@"

