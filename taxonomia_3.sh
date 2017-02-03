#!/bin/bash

######################################################################################################################################
######################################################################################################################################
############################################ SHELL TO CREATE THE TAXONOMY IN HDFS ####################################################
############################################ Author: Jorge Quintana	  	  ####################################################
############################################ Email:  jorge.quintana@experian.com  ####################################################
############################################         jorge.quintana@capgemini.com ####################################################
############################################ Date:   03-02-2017			  ####################################################
######################################################################################################################################
######################################################################################################################################

######################################################################################################################################
######################################################################################################################################
############# First,defining two inputs from user as parameters in the creation process   			     #################
############# TIME_PARTITION : Period of time in which the historic files were generated  			     #################
############# REGION         : Specific region to create, for instance, Colombia	  			     #################
######################################################################################################################################
######################################################################################################################################
############ Once these variables were defined a validation process is executed in order to identify if the user has #################
############ typed all the variables needed to the creation process. If yes, the script continues and defines a fun- #################
############ ction to create the path sent. If the user did not write all the variables the script stops and show a  #################
############ error message and one example of how to use the script.					 	     #################
######################################################################################################################################
######################################################################################################################################
############ In order to minimize the lines of code a creation folders in HDFS function was defined with one input:  #################
############ path : The specific path to create							    		     #################
############ One process has to be executed before creating the specific folder: Validating the existence of the     #################
############ path to create. If the path does not exists the function creates it and returns 0. If the path does     #################
############ exists the function show a message to tell the user the path exists and returns 1.			     #################
######################################################################################################################################
######################################################################################################################################
######## After that, some lists are defined. These lists defines each part of the taxonomy as follows:               #################
######## LIFECYCLE          : It defines the first level of taxonomy, it means, the main areas of data handling	     ################# 
######## LANDING_TYPE       : It defines the second level of taxonomy, it means, the subfolders for landing area     #################
######## STAGING_TYPE       : It defines the second level of taxonomy, it means, the subfolders for staging area     #################
######## PRODUCTION_TYPE    : It defines the second level of taxonomy, it means, the subfolders for production area  #################
######## PUBLISH_TYPE       : It defines the second level of taxonomy, it means, the subfolders for publish area     #################
######## ARCHIVE_TYPE       : It defines the second level of taxonomy, it means, the subfolders for archive area     #################
######## SANATA_MASTER_FILE : It defines the third level of taxonomy, it means, the subfolders of each second area   #################
######## MASTER_FILES       : It defines the  common master files						     #################
######################################################################################################################################
######################################################################################################################################
######## When all variables and functions are correctly defined a iteration process starts and send the specific     #################
######## to the creation_HDFS_folder function to be created.							     #################
######################################################################################################################################
######################################################################################################################################

TIME_PARTITION="$1"
REGION="$2"

function create_HDFS_folder()
{
	path=$1
	hdfs dfs -test -e ${path}
	if [ $? != 0 ]
	then
		echo "Folder ${path} does not exists!"
		echo "Creating folder ${path}"
		hdfs dfs -mkdir -p ${path}
		if [ $? == 0 ]
		then
			echo "Folder ${path} created succesfully!"
			return 0
		else
			echo "Folder ${path} could not be created!"
			return 1
		fi
	else
		echo "Folder ${path} already exists!"
		return 0
	fi
}

LIFECYCLE="landing staging production publish archive"
LANDING_TYPE="sanatas maestroscomunes aplicaciones proyectos"
STAGING_TYPE="sanatas maestroscomunes aplicaciones proyectos"
PRODUCTION_TYPE="aplicaciones maestros hive BCS"
PUBLISH_TYPE="BCS"
ARCHIVE_TYPE=""
SANATA_MASTER_FILE="cartera clisus cteyaho das dian endeuda icbsus"
MASTER_FILES="valores regist sco360m scohis icbcon"

if [ $# -ne 2 ]; then
	echo "Illegal number of parameters"
	echo "Usage:"
	echo "taxonomy.sh [TIME_PARTITION] [REGION]"
	echo "Example:"
	echo "taxonomy.sh 201607 Colombia"
	exit 1
else
	create_HDFS_folder ${REGION}
	if [ $? == 0 ]
	then
		for lc in $LIFECYCLE
		do
			create_HDFS_folder ${REGION}/${lc}
			if [ $? == 0 ]
			then
				case "${lc}" in
				"landing")
					for lnt in $LANDING_TYPE
					do
						create_HDFS_folder ${REGION}/${lc}/${lnt}
						if [ $? == 0 ]
						then
							case "${lnt}" in
							"sanatas")
								for smf in $SANATA_MASTER_FILE
								do
									create_HDFS_folder ${REGION}/${lc}/${lnt}/${TIME_PARTITION}/${smf}
								done
							esac
						else
							exit 1
						fi
					done;;
				"staging")
					for lnt in $STAGING_TYPE
					do
						create_HDFS_folder ${REGION}/${lc}/${lnt}
						if [ $? == 0 ]
						then
							case "${lnt}" in
							"sanatas")
								for smf in $SANATA_MASTER_FILE
								do
									create_HDFS_folder ${REGION}/${lc}/${TIME_PARTITION}/${smf}
								done
							esac
						else
							exit 1
						fi
					done;;
				"production")
					for pt in $PRODUCTION_TYPE
					do
						create_HDFS_folder ${REGION}/${lc}/${pt}
						if [ $? != 0 ]
						then
							exit 1
						fi
					done;;
				"publish")
					for pt in $PUBLISH_TYPE
					do
						create_HDFS_folder ${REGION}/${lc}/${pt}
						if [ $? != 0 ]
						then
							exit 1
						fi
					done
				esac
			else
				exit 1
			fi
		done
	else
		exit 1
	fi
fi                        
