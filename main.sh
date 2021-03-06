#!bin/bash

############################################################################################################
############################################################################################################
##########    Content: Shell Script to run the other Shells                     ############################
##########    Author:  Jorge Quintana                                           ############################
##########    Date:    January, 10th 2017                                       ############################
##########    Contact: jorge.quintana@capgemini.com                             ############################
############################################################################################################
############################################################################################################
############################################################################################################
############################################################################################################
###########                                                                     ############################
########### This shell script execute the specific shell scripts to create the  ############################
###########           following processes and to validate the result   		############################
###########									############################
######################						      ######################################
###################### 1. Taxonomy creation			      ######################################
###################### 2. Migration of Sanata files		      ######################################
###################### 3. Creation of Hive external tables            ######################################
######################   	                                      ######################################                     
############################################################################################################
############################################################################################################

	MY_DB="$1"
	MY_HIVEPORT="$2"
	MY_DATAPATH="$3"

	echo ""
	echo "Creating the Taxonomy ... "
	echo ""
	source ./sh/taxonomia.sh
	echo "Creating folders for each master file"
	echo ""
	source ./sh/folder_creation.sh ${MY_DB} ${MY_HIVEPORT} ${MY_DATAPATH}
	echo "Moving data to HDFS"
	echo ""
	source ./sh/data_migration.sh ${MY_DB} ${MY_HIVEPORT} ${MY_DATAPATH}
