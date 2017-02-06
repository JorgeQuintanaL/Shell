#!bin/bash

########################################################################################################################################
########################################################################################################################################
###############################    Content: Shell Script to create tables on Hive from a HQL file           ############################
###############################    Author:  Jorge Quintana                                                  ############################
###############################    Date:    January, 10th 2017                                              ############################
###############################    Contact: jorge.quintana@capgemini.com                                    ############################
########################################################################################################################################
########################################################################################################################################
###############################                     It receives some parameter                              ############################
############################### MY_HQLFILE:  The HQL file with the creation table commands                  ############################
############################### MY_DB:       The Data Base where the table is going to be created           ############################
############################### MY_TB:       The table to be created                                        ############################
############################### MY_HQLPATH:  The path where the HQL files are stored                        ############################
############################### MY_HIVEPORT: The Hive port on Localhost to connect with Beeline             ############################
############################### MY_USER:     The Hive User to connect with Beeline                          ############################
############################### MY_PSWD:     The Hive Password to connect with Beeline                      ############################
############################### MY_DATAPATH: The path were are created the data folders	 		    ############################
###############################                                                                             ############################
############################### For the variables MY_HQLFILE and MY_TB they will be assigned accordingly to ############################
############################### the name's files in MY_PATH. So, for the creation of tabla sports the HQL   ############################
###############################                   should have this name (sport.hql)                         ############################
########################################################################################################################################
########################################################################################################################################

########################################################################################################################################
###############################                   Defining the input variables:                             ############################
########################################################################################################################################

	MY_DB="$1"
	MY_HIVEPORT="$2"
	MY_DATAPATH="$3"

	echo ""
	echo "Starting process with the following parameters: "
	echo "Database: ${MY_DB}"
	echo "HQL Path: ./hql/"
	echo "Hive Port: ${MY_HIVEPORT}"
	echo "Data Path: ${MY_DATAPATH}"

########################################################################################################################################
############################### With these variables the Beeline connection will be created to check the    ############################
###############################           results and the hiveconf to run the HQL files on Hive 	    ############################
########################################################################################################################################

########################################################################################################################################
########################################################################################################################################
	
	hdfs dfs -test -e /colombia/landing/sanatas/${MY_DB}
	if [ $? != 0 ]; then
	{
		echo "Creating the database named ${MY_DB}"
		hdfs dfs -mkdir -p /colombia/landing/sanatas/${MY_DB}
		if [ $? == 0 ]; then
		{
			echo "Database ${MY_DB} created succesfully!"
			sanatas="cartera clisus cteyaho das dian endeuda icbcon icbsus regist sco360m scohis valores"	
			for sanata in $sanatas
			do
				echo "Creating folder for ${sanata} master file"
				hdfs dfs -mkdir -p /colombia/landing/sanatas/${MY_DB}/${sanata}
				if [ $? == 0 ]; then
				{
					echo "Folder ${MY_DB}/${sanata} created succesfully!"
				}
				else
				{
					echo "Folder ${MY_DB}/${sanata} could not be created!"
				}
				fi
			done		
		}
		else
		{
			echo "Database ${MY_DB} could not be created!"
			exit 1
		}
		fi
	}
	else
	{
		echo "Database ${MY_DB} already exists!"
		exit 1
	}
	fi
	echo "Folders created successfully!"
	return 0
########################################################################################################################################
########################################################################################################################################
