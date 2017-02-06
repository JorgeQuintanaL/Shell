#!bin/bash

############################################################################################################
############################################################################################################
##########    Content: Shell Script to create taxonomy on HDFS                  ############################
##########    Author:  Jorge Quintana                                           ############################
##########    Date:    January, 10th 2017                                       ############################
##########    Contact: jorge.quintana@capgemini.com                             ############################
############################################################################################################
############################################################################################################
############################################################################################################
############################################################################################################
###########								 	############################
########### Building the taxonomy needed to the migration process and external  ############################
###########									############################
############################################################################################################
############################################################################################################

############################################################################################################
###########									############################
###########           The root of the taxonomy is the folder for Colombia       ############################    
###########           From here all the areas are defined and the sanatas       ############################
###########                   files are migrated to their folders               ############################    
###########                                                                     ############################    
###########           The different areas of the taxonomy are the following     ############################
###########                                                                     ############################
###########							      		############################   
################### 1. colombia/landing                                #####################################    
################### 2. colombia/staging                                #####################################
###########                                                                     ############################    
###########      Also, these two areas have different folders inside such as    ############################
###########                                                                     ############################
###########									############################
################### 1.1      colombia/landing/sanatas                  #####################################
################### 1.1.1    colombia/landing/sanatas/....	       #####################################
################### 2.1      colombia/staging		               #####################################
################### 2.1.1    colombia/staging/....  	               #####################################
###########									############################
###########	The taxonomy creation process designed with this script		############################
###########         is only related to /colombia/landing/ folder		############################
###########									############################
############################################################################################################
############################################################################################################

############################################################################################################
############################################################################################################
############################################################################################################
#########									  ##########################
#########   We create the folders in HDFS specified before but previously   ##########################
#########   validating the existence of these folders and the result of creation  ##########################
######### 									  ##########################
############################################################################################################
############################################################################################################

	hdfs dfs -test -e /colombia
	if [ $? != 0 ]; then
		echo "Creating /colombia Directory"
		hdfs dfs -mkdir -p /colombia
		if [ $? == 0 ]; then
			echo "Directory /colombia created succesfully!"
       			echo "Creating /colombia/landing directory"
                	hdfs dfs -mkdir -p /colombia/landing
                	if [ $? == 0 ]; then
                        	echo "Directory /colombia/landing created successfully!"
				echo "Creating /colombia/landing/sanatas directory"
                		hdfs dfs -mkdir -p /colombia/landing/sanatas
               	 		if [ $? == 0 ]; then
                        		echo "Directory /colombia/landing/sanatas created successfully!"
               	 		else
                        		echo "Directory /colombia/landing/sanatas could not be created!"
                        		exit 1
                		fi
        		else
                		echo "Directory /colombia/landing could not be created!"
        		fi
                else
                   	echo "Directory /colombia could not be created!"
                        exit 1
		fi
	else
		echo "Directory /colombia is already created!"
                hdfs dfs -test -e /colombia/landing
                if [ $? != 0 ]; then
                	echo "Creating /colombia/landing directory"
                        hdfs dfs -mkdir -p /colombia/landing
                        if [ $? == 0 ]; then
                      		echo "Directory /colombia/landing created successfully!"
				echo "Creating /colombia/landing/sanatas directory"
				hdfs dfs -mkdir -p /colombia/landing/sanatas
                        	if [ $? == 0 ]; then
					echo "Directory /colombia/landing/sanatas created successfully!"
				else
                                        echo "Directory /colombia/landing/sanatas could not be created!"
                                        exit 1
                                fi
			else
				echo "Directory /colombia/landing could not be created!"
				exit 1
			fi
		else
                	echo "Directory /colombia/landing is already created!"
			hdfs dfs -test -e /colombia/landing/sanatas
			if [ $? != 0 ]; then
				echo "Creating /colombia/landing/sanatas directory"
				hdfs dfs -mkdir -p /colombia/landing/sanatas
				if [ $? == 0 ]; then
					echo "Directory /colombia/landing/sanatas created successfully!"
				else
					echo "Directory /colombia/landing/sanatas could not be created!"
					exit 1
				fi
			else
				echo "Directory /colombia/landing/sanatas is already created!"
			fi
               	fi
	fi
	return 0

###########################################################################################################
###########################################################################################################
#######												 ########## 
####### Finally, if the creation process was successful return a 0 to the main shell to validate ##########
#######             the result of the process and continue with the next execution               ##########
#######												 ##########
###########################################################################################################
###########################################################################################################
