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
	echo ""

########################################################################################################################################
############################### With these variables the Beeline connection will be created to check the    ############################
###############################           results and the hiveconf to run the HQL files on Hive 	    ############################
########################################################################################################################################

########################################################################################################################################
########################################################################################################################################
	
		sanatas="cartera clisus cteyaho das dian endeuda icbcon icbsus regist scohis valores"		
                for file in ./hql/*
                do
                        MY_HQLFILE=${file:6:20}
                        MY_TB=${MY_HQLFILE%.*}
                        echo ""
			echo ${MY_HQLFILE}
			echo ${MY_TB}
                        echo "............Creating ${MY_TB}................."
                        hive --hiveconf MY_DB=${MY_DB} --hiveconf MY_TB=${MY_TB} --hiveconf MY_DATAPATH=${MY_DATAPATH} -f ./hql/${MY_HQLFILE}
                done


########################################################################################################################################
########################################################################################################################################
