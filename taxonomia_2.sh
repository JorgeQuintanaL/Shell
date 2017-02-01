#!/bin/bash

TIME_PARTITION="$1"
##REGION="$2"

if [ $# -ne 1 ]; then
	echo "Illegal number of parameters"
	echo "Usage:"
	echo "taxonomy.sh [TIME_PARTITION]"
	echo "Example:"
	echo "taxonomy.sh 201607"
	exit 1
else
	LIFECYCLE="landing staging production publish archive"
	LANDING_STAGING_TYPE="sanatas maestroscomunes aplicaciones proyectos"
	PRODUCTION_TYPE="aplicaciones maestros hive BCS"
	PUBLISH_TYPE="BCS"
	ARCHIVE_TYPE=""
	SANATA_MASTER_FILE="cartera clisus cteyaho das dian endeuda icbsus"
	MASTER_FILE_COMUNES="valores regist sco360m scohis icbcon"

	echo "Checking if the folder /Colombia exists"
	hdfs dfs -test -e /Colombia
	if [ $? != 0 ]; then
		echo "Folder /Colombia does not exists"
		echo "Creating folder /Colombia"
		hdfs dfs -mkdir -p /Colombia
		if [ $? == 0 ]; then
			echo "Folder /Colombia was created succesfully!"
			for lc in $LIFECYCLE
			do
				echo "Checking if the folder /Colombia/${lc} exists"
				hdfs dfs -test -e /Colombia/${lc}
				if [ $? != 0 ]; then
					echo "Folder /Colombia/${lc} does not exists"
					echo "Creating folder /Colombia/${lc}"
					hdfs dfs -mkdir -p /Colombia/${lc}
					if [ $? == 0 ]; then
						echo "Folder /Colombia/${lc} was created succesfully!"
						case "${lc}" in
							"landing")
							for lnt in $LANDING_STAGING_TYPE
							do
								echo "Checking if folder /Colombia/${lc}/${lnt} exists"
								hdfs dfs -test -e /Colombia/${lc}/${lnt}
								if [ $? != 0 ]; then
									echo "Folder /Colombia/${lc}/${lnt} does not exists"
									echo "Creating /Colombia/${lc}/${lnt}"
									hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}
									if [ $? == 0 ]; then
										echo "Folder /Colombia/${lc}/${lnt} was created succesfully!"
										case "${lnt}" in
											"sanatas")
											for smf in $SANATA_MASTER_FILE
											do
												echo "Checking if folder /Colombia/${lc}/${lnt}/${smf} exists"
												hdfs dfs -test -e /Colombia/${lc}/${lnt}/${smf}
												if [ $? != 0 ]; then
													echo "Folder /Colombia/${lc}/${lnt}/${smf} does not exists"
													echo "Creating /Colombia/${lc}/${lnt}/${smf}"
													hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}/${smf}
													if [ $? == 0 ]; then
														echo "Folder /Colombia/${lc}/${lnt}/${smf} was created successfully!"
													else
														echo "Folder /Colombia/${lc}/${lnt}/${smf} could not be created!"
														exit 1
													fi
												else
													echo "Folder /Colombia/${lc}/${lnt}/${smf} already exists!"
												fi
											done
										esac
									else
										echo "Folder /Colombia/${lc}/${lnt} could not be created!"
									fi
								else
									echo "Folder /Colombia/${lc}/${lnt} already exists!"
                                                                	case ${lnt} in
                                                                        	"sanatas")
                                                                        	for smf in $SANATA_MASTER_FILE
                                                                        	do
                                                                               		echo "Checking if folder /Colombia/${lc}/${lnt}/${smf} exists"
                                                                               		hdfs dfs -test -e /Colombia/${lc}/${lnt}/${smf}
                                                                               		if [ $? != 0 ]; then
                                                                                 		echo "Folder /Colombia/${lc}/${lnt}/${smf} does not exists"
                                                                                 		echo "Creating /Colombia/${lc}/${lnt}/${smf}"
                                                                                 		hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}/${smf}
                                                                                 		if [ $? == 0 ]; then
                                                                                    			echo "Folder /Colombia/${lc}/${lnt}/${smf} was created successfully!"
                                                                                 		else
                                                                                    			echo "Folder /Colombia/${lc}/${lnt}/${smf} could not be created!"
                                                                                   	 		exit 1
                                                                                 		fi
                                                                               		else
                                                                                     		echo "Folder /Colombia/${lc}/${lnt}/${smf} already exists!"
                                                                               		fi
                                                                        	done
                                                                	esac
								fi
							done;;
                                        		"staging")
                                        		for lnt in $LANDING_STAGING_TYPE
                                        		do
                                                		echo "Checking if folder /Colombia/${lc}/${lnt} exists" 
                                                		hdfs dfs -test -e /Colombia/${lc}/${lnt}
                                                		if [ $? != 0 ]; then
                                                        		echo "Folder /Colombia/${lc}/${lnt} does not exists"
                                                        		echo "Creating /Colombia/${lc}/${lnt}"
                                                        		hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}
                                                        		if [ $? == 0 ]; then
                                                                		echo "Folder /Colombia/${lc}/${lnt} was created succesfully!"
                                                                                case "${lnt}" in
                                                                                        "sanatas")
                                                                                        for smf in $SANATA_MASTER_FILE
                                                                                        do
                                                                                                echo "Checking if folder /Colombia/${lc}/${lnt}/${smf} exists"
                                                                                                hdfs dfs -test -e /Colombia/${lc}/${lnt}/${smf}
                                                                                                if [ $? != 0 ]; then
                                                                                                        echo "Folder /Colombia/${lc}/${lnt}/${smf} does not exists"
                                                                                                        echo "Creating /Colombia/${lc}/${lnt}/${smf}"
                                                                                                        hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}/${smf}
                                                                                                        if [ $? == 0 ]; then
                                                                                                                echo "Folder /Colombia/${lc}/${lnt}/${smf} was created successfully!"
                                                                                                        else
                                                                                                                echo "Folder /Colombia/${lc}/${lnt}/${smf} could not be created!"
                                                                                                                exit 1
                                                                                                        fi
                                                                                                else
                                                                                                        echo "Folder /Colombia/${lc}/${lnt}/${smf} already exists!"
                                                                                                fi
                                                                                        done
										esac
                                                        		else
                                                                		echo "Folder /Colombia/${lc}/${lnt} could not be created!"
                                                                		exit 1
                                                        		fi
                                                		else
                                                        		echo "Folder /Colombia/${lc}/${lnt} already exists!"
                                                                	case ${lnt} in
                                                                        	"sanatas")
                                                                        	for smf in $SANATA_MASTER_FILE
                                                                        	do
                                                                               		echo "Checking if folder /Colombia/${lc}/${lnt}/${smf} exists"
                                                                               		hdfs dfs -test -e /Colombia/${lc}/${lnt}/${smf}
                                                                               		if [ $? != 0 ]; then
                                                                                 		echo "Folder /Colombia/${lc}/${lnt}/${smf} does not exists"
                                                                                 		echo "Creating /Colombia/${lc}/${lnt}/${smf}"
                                                                                 		hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}/${smf}
                                                                                 		if [ $? == 0 ]; then
                                                                                    			echo "Folder /Colombia/${lc}/${lnt}/${smf} was created successfully!"
                                                                                 		else
                                                                                    			echo "Folder /Colombia/${lc}/${lnt}/${smf} could not be created!"
                                                                                    			exit 1
                                                                                 		fi
                                                                               		else
                                                                                     		echo "Folder /Colombia/${lc}/${lnt}/${smf} already exists!"
                                                                               		fi
                                                                        	done
                                                                	esac
                                                		fi
                                        		done;;
							"production")
							for pt in $PRODUCTION_TYPE
							do
								echo "Checking if folder /Colombia/${lc}/${pt} exists"
								hdfs dfs -test -e /Colombia/${lc}/${pt}
								if [ $? != 0 ]; then
									echo "Folder /Colombia/${lc}/${pt} does not exists!"
									echo "Creating /Colombia/${lc}/${pt}"
									hdfs dfs -mkdir -p /Colombia/${lc}/${pt}
									if [ $? == 0 ]; then
										echo "Folder /Colombia/${lc}/${pt} was created succesfully!"
									else
										echo "Folder /Colombia/${lc}/${pt} could not be created"
										exit 1
									fi
								else
									echo "Folder /Colombia/${lc}/${pt} already exists!"
								fi
							done;;
                                                        "publish")
                                                        for pt in $PUBLISH_TYPE
                                                        do
                                                                echo "Checking if folder /Colombia/${lc}/${pt} exists"
                                                                hdfs dfs -test -e /Colombia/${lc}/${pt}
                                                                if [ $? != 0 ]; then
                                                                        echo "Folder /Colombia/${lc}/${pt} does not exists!"
                                                                        echo "Creating /Colombia/${lc}/${pt}"
                                                                        hdfs dfs -mkdir -p /Colombia/${lc}/${pt}
                                                                        if [ $? == 0 ]; then
                                                                                echo "Folder /Colombia/${lc}/${pt} was created succesfully!"
                                                                        else
                                                                                echo "Folder /Colombia/${lc}/${pt} could not be created"
                                                                                exit 1
                                                                        fi
                                                                else
                                                                        echo "Folder /Colombia/${lc}/${pt} already exists!"
                                                                fi
                                                        done	
						esac
					else
						echo "Folder /Colombia/${lc} could not be created!"
						exit 1
					fi
				else
					echo "Folder /Colombia/${lc} already exists!"
                                        case "${lc}" in
                                        	"landing")
                                        	for lnt in $LANDING_STAGING_TYPE
                                       		do
                                       			echo "Checking if folder /Colombia/${lc}/${lnt} exists"
                                                 	hdfs dfs -test -e /Colombia/${lc}/${lnt}
                                                 	if [ $? != 0 ]; then
          	                                       		echo "Folder /Colombia/${lc}/${lnt} does not exists"
                                                       		echo "Creating /Colombia/${lc}/${lnt}"
                                                       		hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}
                                                       		if [ $? == 0 ]; then
       		                                                	echo "Folder /Colombia/${lc}/${lnt} was created succesfully!"
                                                                        case "${lnt}" in
                                                        	                "sanatas")
                                                                                 for smf in $SANATA_MASTER_FILE
                                                                                 do
                                   	                                              echo "Checking if folder /Colombia/${lc}/${lnt}/${smf} exists"
                                                                                      hdfs dfs -test -e /Colombia/${lc}/${lnt}/${smf}
                                                                                      if [ $? != 0 ]; then
                        	                                                              echo "Folder /Colombia/${lc}/${lnt}/${smf} does not exists"
                                                                                              echo "Creating /Colombia/${lc}/${lnt}/${smf}"
                                                                                              hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}/${smf}
                                                                                              if [ $? == 0 ]; then
                          	                                                                    echo "Folder /Colombia/${lc}/${lnt}/${smf} was created successfully!"
                                                                                              else
                        	                                                                      echo "Folder /Colombia/${lc}/${lnt}/${smf} could not be created!"
                                                                                                      exit 1
                                                                                              fi
                                                                                      else
             	                                                                              echo "Folder /Colombia/${lc}/${lnt}/${smf} already exists!"
                                                                                      fi
                                                                                 done
									esac
                                                       		else
                                                                	echo "Folder /Colombia/${lc}/${lnt} could not be created!"
									exit 1
                                                       		fi
               	                                 	else
						       		echo "Folder /Colombia/${lc}/${lnt} already exists!"
                                                                case ${lnt} in
                                                                        "sanatas")
                                                                        for smf in $SANATA_MASTER_FILE
                                                                        do
                                                                               echo "Checking if folder /Colombia/${lc}/${lnt}/${smf} exists"
                                                                               hdfs dfs -test -e /Colombia/${lc}/${lnt}/${smf}
                                                                               if [ $? != 0 ]; then
                                                                                 echo "Folder /Colombia/${lc}/${lnt}/${smf} does not exists"
                                                                                 echo "Creating /Colombia/${lc}/${lnt}/${smf}"
                                                                                 hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}/${smf}
                                                                                 if [ $? == 0 ]; then
                                                                                    echo "Folder /Colombia/${lc}/${lnt}/${smf} was created successfully!"
                                                                                 else
                                                                                    echo "Folder /Colombia/${lc}/${lnt}/${smf} could not be created!"
                                                                                    exit 1
                                                                                 fi
                                                                               else
                                                                                     echo "Folder /Colombia/${lc}/${lnt}/${smf} already exists!"
                                                                               fi
                                                                        done
                                                                esac
                                                 	fi
                                        	done;;
                                        	"staging")
                                        	for lnt in $LANDING_STAGING_TYPE
                                        	do
                                                	echo "Checking if folder /Colombia/${lc}/${lnt} exists" 
                                                	hdfs dfs -test -e /Colombia/${lc}/${lnt}
                                                	if [ $? != 0 ]; then
                                                        	echo "Folder /Colombia/${lc}/${lnt} does not exists"
                                                        	echo "Creating /Colombia/${lc}/${lnt}"
                                                        	hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}
                                                        	if [ $? == 0 ]; then
                                                                	echo "Folder /Colombia/${lc}/${lnt} was created succesfully!"
                                                                        case "${lnt}" in
                                                                                "sanatas")
                                                                                 for smf in $SANATA_MASTER_FILE
                                                                                 do
                                                                                      echo "Checking if folder /Colombia/${lc}/${lnt}/${smf} exists"
                                                                                      hdfs dfs -test -e /Colombia/${lc}/${lnt}/${smf}
                                                                                      if [ $? != 0 ]; then
                                                                                              echo "Folder /Colombia/${lc}/${lnt}/${smf} does not exists"
                                                                                              echo "Creating /Colombia/${lc}/${lnt}/${smf}"
                                                                                              hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}/${smf}
                                                                                              if [ $? == 0 ]; then
                                                                                                    echo "Folder /Colombia/${lc}/${lnt}/${smf} was created successfully!"
                                                                                              else
                                                                                                      echo "Folder /Colombia/${lc}/${lnt}/${smf} could not be created!"
                                                                                                      exit 1
                                                                                              fi
                                                                                      else
                                                                                              echo "Folder /Colombia/${lc}/${lnt}/${smf} already exists!"
                                                                                      fi
                                                                                 done
                                                                        esac
                                                        	else
                                                                	echo "Folder /Colombia/${lc}/${lnt} could not be created!"
                                                                	exit 1
                                                        	fi
                                                	else
                                                        	echo "Folder /Colombia/${lc}/${lnt} already exists!"
                                                                case ${lnt} in
                                                                        "sanatas")
                                                                        for smf in $SANATA_MASTER_FILE
                                                                        do
                                                                               echo "Checking if folder /Colombia/${lc}/${lnt}/${smf} exists"
                                                                               hdfs dfs -test -e /Colombia/${lc}/${lnt}/${smf}
                                                                               if [ $? != 0 ]; then
                                                                                 echo "Folder /Colombia/${lc}/${lnt}/${smf} does not exists"
                                                                                 echo "Creating /Colombia/${lc}/${lnt}/${smf}"
                                                                                 hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}/${smf}
                                                                                 if [ $? == 0 ]; then
                                                                                    echo "Folder /Colombia/${lc}/${lnt}/${smf} was created successfully!"
                                                                                 else
                                                                                    echo "Folder /Colombia/${lc}/${lnt}/${smf} could not be created!"
                                                                                    exit 1
                                                                                 fi
                                                                               else
                                                                                     echo "Folder /Colombia/${lc}/${lnt}/${smf} already exists!"
                                                                               fi
                                                                        done
                                                                esac
                                                	fi
                                        	done;;
                                                "production")
                                                 for pt in $PRODUCTION_TYPE
                                                 do
                            	                     echo "Checking if folder /Colombia/${lc}/${pt} exists"
                                                     hdfs dfs -test -e /Colombia/${lc}/${pt} 
                                                     if [ $? != 0 ]; then
      		                                               echo "Folder /Colombia/${lc}/${pt} does not exists!"
                                                               echo "Creating /Colombia/${lc}/${pt}"
                                                               hdfs dfs -mkdir -p /Colombia/${lc}/${pt}
                                                               if [ $? == 0 ]; then
      		                                                         echo "Folder /Colombia/${lc}/${pt} was created succesfully!"
                                                               else
               		                                                echo "Folder /Colombia/${lc}/${pt} could not be created"
                                                                        exit 1
                                                               fi
                                                     else
                                                               echo "Folder /Colombia/${lc}/${pt} already exists!"
                                                     fi
                                                 done;;
                                                "publish")
                                                 for pt in $PUBLISH_TYPE
                                                 do
                                                     echo "Checking if folder /Colombia/${lc}/${pt} exists"
                                                     hdfs dfs -test -e /Colombia/${lc}/${pt}
                                                     if [ $? != 0 ]; then
                                                               echo "Folder /Colombia/${lc}/${pt} does not exists!"
                                                               echo "Creating /Colombia/${lc}/${pt}"
                                                               hdfs dfs -mkdir -p /Colombia/${lc}/${pt}
                                                               if [ $? == 0 ]; then
                                                                         echo "Folder /Colombia/${lc}/${pt} was created succesfully!"
                                                               else
                                                                        echo "Folder /Colombia/${lc}/${pt} could not be created"
                                                                        exit 1
                                                               fi
                                                     else
                                                               echo "Folder /Colombia/${lc}/${pt} already exists!"
                                                     fi
                                                 done
                       			esac
				fi
			done
		else
			echo "Folder /Colombia could not be created!"
			exit 1
		fi
	else
		echo "Folder /Colombia already exists!"
		for lc in $LIFECYCLE
		do
			echo "Checking if the folder /Colombia/${lc} exists"
			hdfs dfs -test -e /Colombia/${lc}
			if [ $? != 0 ]; then
				echo "Folder /Colombia/${lc} does not exists"
				echo "Creating folder /Colombia/${lc}"
				hdfs dfs -mkdir -p /Colombia/${lc}
				if [ $? == 0 ]; then
					echo "Folder /Colombia/${lc} was created succesfully!"
                                        case "${lc}" in
                                        	"landing")
                                                for lnt in $LANDING_STAGING_TYPE
                                                do
                                                        echo "Checking if folder /Colombia/${lc}/${lnt} exists"
							hdfs dfs -test -e /Colombia/${lc}/${lnt}
                                                        if [ $? != 0 ]; then
                                                                echo "Folder /Colombia/${lc}/${lnt} does not exists"
                                                                echo "Creating /Colombia/${lc}/${lnt}"
                                                                hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}
                                                                if [ $? == 0 ]; then
                                                                        echo "Folder /Colombia/${lc}/${lnt} was created succesfully!"
                                                                        case "${lnt}" in
                                                                                "sanatas")
                                                                                 for smf in $SANATA_MASTER_FILE
                                                                                 do
                                                                                      echo "Checking if folder /Colombia/${lc}/${lnt}/${smf} exists"
                                                                                      hdfs dfs -test -e /Colombia/${lc}/${lnt}/${smf}
                                                                                      if [ $? != 0 ]; then
                                                                                              echo "Folder /Colombia/${lc}/${lnt}/${smf} does not exists"
                                                                                              echo "Creating /Colombia/${lc}/${lnt}/${smf}"
                                                                                              hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}/${smf}
                                                                                              if [ $? == 0 ]; then
                                                                                                    echo "Folder /Colombia/${lc}/${lnt}/${smf} was created successfully!"
                                                                                              else
                                                                                                      echo "Folder /Colombia/${lc}/${lnt}/${smf} could not be created!"
                                                                                                      exit 1
                                                                                              fi
                                                                                      else
                                                                                              echo "Folder /Colombia/${lc}/${lnt}/${smf} already exists!"
                                                                                      fi
                                                                                 done
                                                                        esac
                                                                else
                                                                        echo "Folder /Colombia/${lc}/${lnt} could not be created!"
                                                                fi
                                                        else
                                                                echo "Folder /Colombia/${lc}/${lnt} already exists!"
                                                                case ${lnt} in
                                                                        "sanatas")
                                                                        for smf in $SANATA_MASTER_FILE
                                                                        do
                                                                               echo "Checking if folder /Colombia/${lc}/${lnt}/${smf} exists"
                                                                               hdfs dfs -test -e /Colombia/${lc}/${lnt}/${smf}
                                                                               if [ $? != 0 ]; then
                                                                                 echo "Folder /Colombia/${lc}/${lnt}/${smf} does not exists"
                                                                                 echo "Creating /Colombia/${lc}/${lnt}/${smf}"
                                                                                 hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}/${smf}
                                                                                 if [ $? == 0 ]; then
                                                                                    echo "Folder /Colombia/${lc}/${lnt}/${smf} was created successfully!"
                                                                                 else
                                                                                    echo "Folder /Colombia/${lc}/${lnt}/${smf} could not be created!"
                                                                                    exit 1
                                                                                 fi
                                                                               else
                                                                                     echo "Folder /Colombia/${lc}/${lnt}/${smf} already exists!"
                                                                               fi
                                                                        done
                                                                esac
                                                        fi
                                                done;;
                                        	"staging")
                                        	for lnt in $LANDING_STAGING_TYPE
                                       		do
                                                	echo "Checking if folder /Colombia/${lc}/${lnt} exists" 
                                                	hdfs dfs -test -e /Colombia/${lc}/${lnt}
                                                	if [ $? != 0 ]; then
                                                        	echo "Folder /Colombia/${lc}/${lnt} does not exists"
                                                        	echo "Creating /Colombia/${lc}/${lnt}"
                                                        	hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}
                                                        	if [ $? == 0 ]; then
                                                                	echo "Folder /Colombia/${lc}/${lnt} was created succesfully!"
                                                                        case "${lnt}" in
                                                                                "sanatas")
                                                                                 for smf in $SANATA_MASTER_FILE
                                                                                 do
                                                                                      echo "Checking if folder /Colombia/${lc}/${lnt}/${smf} exists"
                                                                                      hdfs dfs -test -e /Colombia/${lc}/${lnt}/${smf}
                                                                                      if [ $? != 0 ]; then
                                                                                              echo "Folder /Colombia/${lc}/${lnt}/${smf} does not exists"
                                                                                              echo "Creating /Colombia/${lc}/${lnt}/${smf}"
                                                                                              hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}/${smf}
                                                                                              if [ $? == 0 ]; then
                                                                                                    echo "Folder /Colombia/${lc}/${lnt}/${smf} was created successfully!"
                                                                                              else
                                                                                                      echo "Folder /Colombia/${lc}/${lnt}/${smf} could not be created!"
                                                                                                      exit 1
                                                                                              fi
                                                                                      else
                                                                                              echo "Folder /Colombia/${lc}/${lnt}/${smf} already exists!"
                                                                                      fi
                                                                                 done
                                                                        esac
                                                        	else
                                                                	echo "Folder /Colombia/${lc}/${lnt} could not be created!"
                                                                	exit 1
                                                        	fi
                                                	else
                                                        	echo "Folder /Colombia/${lc}/${lnt} already exists!"
                                                                case ${lnt} in
                                                                        "sanatas")
                                                                        for smf in $SANATA_MASTER_FILE
                                                                        do
                                                                               echo "Checking if folder /Colombia/${lc}/${lnt}/${smf} exists"
                                                                               hdfs dfs -test -e /Colombia/${lc}/${lnt}/${smf}
                                                                               if [ $? != 0 ]; then
                                                                                 echo "Folder /Colombia/${lc}/${lnt}/${smf} does not exists"
                                                                                 echo "Creating /Colombia/${lc}/${lnt}/${smf}"
                                                                                 hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}/${smf}
                                                                                 if [ $? == 0 ]; then
                                                                                    echo "Folder /Colombia/${lc}/${lnt}/${smf} was created successfully!"
                                                                                 else
                                                                                    echo "Folder /Colombia/${lc}/${lnt}/${smf} could not be created!"
                                                                                    exit 1
                                                                                 fi
                                                                               else
                                                                                     echo "Folder /Colombia/${lc}/${lnt}/${smf} already exists!"
                                                                               fi
                                                                        done
                                                                esac
                                                	fi
                                        	done;;
                                                "production")
                                                 for pt in $PRODUCTION_TYPE
                                                 do
                          	                       echo "Checking if folder /Colombia/${lc}/${pt} exists"
                                                       hdfs dfs -test -e /Colombia/${lc}/${pt} 
                                                       if [ $? != 0 ]; then
                              		                         echo "Folder /Colombia/${lc}/${pt} does not exists!"
                                                                 echo "Creating /Colombia/${lc}/${pt}"
                                                                 hdfs dfs -mkdir -p /Colombia/${lc}/${pt}
                                                                 if [ $? == 0 ]; then
                    		                                             echo "Folder /Colombia/${lc}/${pt} was created succesfully!"
                                                                 else
                                                                             echo "Folder /Colombia/${lc}/${pt} could not be created"
                                                                             exit 1
                                                                fi
                                                       else
                                                                echo "Folder /Colombia/${lc}/${pt} already exists!"
                                                       fi
                                                 done;;
                                                "publish")
                                                 for pt in $PUBLISH_TYPE
                                                 do
                                                       echo "Checking if folder /Colombia/${lc}/${pt} exists"
                                                       hdfs dfs -test -e /Colombia/${lc}/${pt}
                                                       if [ $? != 0 ]; then
                                                                 echo "Folder /Colombia/${lc}/${pt} does not exists!"
                                                                 echo "Creating /Colombia/${lc}/${pt}"
                                                                 hdfs dfs -mkdir -p /Colombia/${lc}/${pt}
                                                                 if [ $? == 0 ]; then
                                                                             echo "Folder /Colombia/${lc}/${pt} was created succesfully!"
                                                                 else
                                                                             echo "Folder /Colombia/${lc}/${pt} could not be created"
                                                                             exit 1
                                                                fi
                                                       else
                                                                echo "Folder /Colombia/${lc}/${pt} already exists!"
                                                       fi
                                                 done
                                        esac
				else
					echo "Folder /Colombia/${lc} could not be created!"
					exit 1
				fi
			else
				echo "Folder /Colombia/${lc} already exists!"
                                case ${lc} in
                 	        	"landing")
         	      			for lnt in $LANDING_STAGING_TYPE
                                	do
             		               		echo "Checking if folder /Colombia/${lc}/${lnt} exists" 
						hdfs dfs -test -e /Colombia/${lc}/${lnt}
                                        	if [ $? != 0 ]; then
	                         	     		echo "Folder /Colombia/${lc}/${lnt} does not exists"
                                              		echo "Creating /Colombia/${lc}/${lnt}"
                                              		hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}
                                              		if [ $? == 0 ]; then
               	                               			echo "Folder /Colombia/${lc}/${lnt} was created succesfully!"
                                                                case ${lnt} in
                                                	                "sanatas")
                                                                         for smf in $SANATA_MASTER_FILE
                                                                         do
                                  	                                       echo "Checking if folder /Colombia/${lc}/${lnt}/${smf} exists"
                                                                               hdfs dfs -test -e /Colombia/${lc}/${lnt}/${smf}
                                                                               if [ $? != 0 ]; then
                      	                                                         echo "Folder /Colombia/${lc}/${lnt}/${smf} does not exists"
                                                                                 echo "Creating /Colombia/${lc}/${lnt}/${smf}"
                                                                                 hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}/${smf}
                                                                                 if [ $? == 0 ]; then
     	                                                                            echo "Folder /Colombia/${lc}/${lnt}/${smf} was created successfully!"
                                                                                 else
     	                                                                            echo "Folder /Colombia/${lc}/${lnt}/${smf} could not be created!"
                                                                                    exit 1
                                                                                 fi
                              	                                               else
                      	                                                             echo "Folder /Colombia/${lc}/${lnt}/${smf} already exists!"
                                                                               fi
                                                                         done
                                                                esac
                                               		else
                    	                           		echo "Folder /Colombia/${lc}/${lnt} could not be created!"
								exit 1
                                               		fi
                                        	else
       	                                       		echo "Folder /Colombia/${lc}/${lnt} already exists!"
                                                                case ${lnt} in
                                                                        "sanatas")
                                                                        for smf in $SANATA_MASTER_FILE
                                                                        do
                                                                               echo "Checking if folder /Colombia/${lc}/${lnt}/${smf} exists"
                                                                               hdfs dfs -test -e /Colombia/${lc}/${lnt}/${smf}
                                                                               if [ $? != 0 ]; then
                                                                                 echo "Folder /Colombia/${lc}/${lnt}/${smf} does not exists"
                                                                                 echo "Creating /Colombia/${lc}/${lnt}/${smf}"
                                                                                 hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}/${smf}
                                                                                 if [ $? == 0 ]; then
                                                                                    echo "Folder /Colombia/${lc}/${lnt}/${smf} was created successfully!"
                                                                                 else
                                                                                    echo "Folder /Colombia/${lc}/${lnt}/${smf} could not be created!"
                                                                                    exit 1
                                                                                 fi
                                                                               else
                                                                                     echo "Folder /Colombia/${lc}/${lnt}/${smf} already exists!"
                                                                			case ${lnt} in
                                                                        		"sanatas")
                                                                        		for smf in $SANATA_MASTER_FILE
                                                                        		do
                                                                               			echo "Checking if folder /Colombia/${lc}/${lnt}/${smf} exists"
                                                                               			hdfs dfs -test -e /Colombia/${lc}/${lnt}/${smf}
                                                                               			if [ $? != 0 ]; then
                                                                                 			echo "Folder /Colombia/${lc}/${lnt}/${smf} does not exists"
                                                                                 			echo "Creating /Colombia/${lc}/${lnt}/${smf}"
                                                                                 			hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}/${smf}
                                                                                 			if [ $? == 0 ]; then
                                                                                    				echo "Folder /Colombia/${lc}/${lnt}/${smf} was created successfully!"
                                                                                 			else
                                                                                    				echo "Folder /Colombia/${lc}/${lnt}/${smf} could not be created!"
                                                                                    				exit 1
                                                                                 			fi
                                                                               			else
                                                                                     			echo "Folder /Colombia/${lc}/${lnt}/${smf} already exists!"
                                                                               			fi
                                                                        		done
                                                                			esac
                                                                               fi
                                                                        done
                                                                esac
                                        	fi
                               		done;;
					"staging")
                                        for lnt in $LANDING_STAGING_TYPE
                                        do
                                                echo "Checking if folder /Colombia/${lc}/${lnt} exists" 
                                                hdfs dfs -test -e /Colombia/${lc}/${lnt}
                                                if [ $? != 0 ]; then
                                                        echo "Folder /Colombia/${lc}/${lnt} does not exists"
                                                        echo "Creating /Colombia/${lc}/${lnt}"
                                                        hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}
                                                        if [ $? == 0 ]; then
                                                                echo "Folder /Colombia/${lc}/${lnt} was created succesfully!"
                                                                case ${lnt} in
                                                                	"sanatas")
                                                                        for smf in $SANATA_MASTER_FILE
                                                                        do
                                                                               echo "Checking if folder /Colombia/${lc}/${lnt}/${smf} exists"
                                                                               hdfs dfs -test -e /Colombia/${lc}/${lnt}/${smf}
                                                                               if [ $? != 0 ]; then
                                                                                 echo "Folder /Colombia/${lc}/${lnt}/${smf} does not exists"
                                                                                 echo "Creating /Colombia/${lc}/${lnt}/${smf}"
                                                                                 hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}/${smf}
                                                                                 if [ $? == 0 ]; then
                                                                                    echo "Folder /Colombia/${lc}/${lnt}/${smf} was created successfully!"
                                                                                 else
                                                                                    echo "Folder /Colombia/${lc}/${lnt}/${smf} could not be created!"
                                                                                    exit 1
                                                                                 fi
                                                                               else
                                                                                     echo "Folder /Colombia/${lc}/${lnt}/${smf} already exists!"
                                                                		   case ${lnt} in
                                                                        		"sanatas")
                                                                        		for smf in $SANATA_MASTER_FILE
                                                                        		do
                                                                               			echo "Checking if folder /Colombia/${lc}/${lnt}/${smf} exists"
                                                                               			hdfs dfs -test -e /Colombia/${lc}/${lnt}/${smf}
                                                                               			if [ $? != 0 ]; then
                                                                                 			echo "Folder /Colombia/${lc}/${lnt}/${smf} does not exists"
                                                                                 			echo "Creating /Colombia/${lc}/${lnt}/${smf}"
                                                                                 			hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}/${smf}
                                                                                 			if [ $? == 0 ]; then
                                                                                    				echo "Folder /Colombia/${lc}/${lnt}/${smf} was created successfully!"
                                                                                 			else
                                                                                    				echo "Folder /Colombia/${lc}/${lnt}/${smf} could not be created!"
                                                                                    				exit 1
                                                                                 			fi
                                                                               			else
                                                                                     			echo "Folder /Colombia/${lc}/${lnt}/${smf} already exists!"
                                                                               			fi
                                                                        		done
                                                                		   esac
                                                                               fi
                                                                        done
                                                                esac
                                                        else
                                                                echo "Folder /Colombia/${lc}/${lnt} could not be created!"
                                                                exit 1
                                                        fi
                                                else
                                                        echo "Folder /Colombia/${lc}/${lnt} already exists!"
                                                                case ${lnt} in
                                                                        "sanatas")
                                                                        for smf in $SANATA_MASTER_FILE
                                                                        do
                                                                               echo "Checking if folder /Colombia/${lc}/${lnt}/${smf} exists"
                                                                               hdfs dfs -test -e /Colombia/${lc}/${lnt}/${smf}
                                                                               if [ $? != 0 ]; then
                                                                                 echo "Folder /Colombia/${lc}/${lnt}/${smf} does not exists"
                                                                                 echo "Creating /Colombia/${lc}/${lnt}/${smf}"
                                                                                 hdfs dfs -mkdir -p /Colombia/${lc}/${lnt}/${smf}
                                                                                 if [ $? == 0 ]; then
                                                                                    echo "Folder /Colombia/${lc}/${lnt}/${smf} was created successfully!"
                                                                                 else
                                                                                    echo "Folder /Colombia/${lc}/${lnt}/${smf} could not be created!"
                                                                                    exit 1
                                                                                 fi
                                                                               else
                                                                                     echo "Folder /Colombia/${lc}/${lnt}/${smf} already exists!"
                                                                               fi
                                                                        done
                                                                esac
                                                fi
                                        done;;
                                        "production")
                                         for pt in $PRODUCTION_TYPE
                                         do
  	                                       echo "Checking if folder /Colombia/${lc}/${pt} exists"
                                               hdfs dfs -test -e /Colombia/${lc}/${pt} 
                                               if [ $? != 0 ]; then
                	                               echo "Folder /Colombia/${lc}/${pt} does not exists!"
                                                       echo "Creating /Colombia/${lc}/${pt}"
                                                       hdfs dfs -mkdir -p /Colombia/${lc}/${pt}
                                                       if [ $? == 0 ]; then
                  	                                     echo "Folder /Colombia/${lc}/${pt} was created succesfully!"
                                                       else
                                                             echo "Folder /Colombia/${lc}/${pt} could not be created"
                                                             exit 1
                                                       fi
                                               else
                                                       echo "Folder /Colombia/${lc}/${pt} already exists!"
                                               fi
                                         done;;
                                        "publish")
                                         for pt in $PUBLISH_TYPE
                                         do
                                               echo "Checking if folder /Colombia/${lc}/${pt} exists"
                                               hdfs dfs -test -e /Colombia/${lc}/${pt}
                                               if [ $? != 0 ]; then
                                                       echo "Folder /Colombia/${lc}/${pt} does not exists!"
                                                       echo "Creating /Colombia/${lc}/${pt}"
                                                       hdfs dfs -mkdir -p /Colombia/${lc}/${pt}
                                                       if [ $? == 0 ]; then
                                                             echo "Folder /Colombia/${lc}/${pt} was created succesfully!"
                                                       else
                                                             echo "Folder /Colombia/${lc}/${pt} could not be created"
                                                             exit 1
                                                       fi
                                               else
                                                       echo "Folder /Colombia/${lc}/${pt} already exists!"
                                               fi
                                         done
                               	esac
			fi
		done
	fi
fi
