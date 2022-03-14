#!/bin/bash
#
#	This is script is for users that want to automate their local environment.
#	It helps to easily activate the environment, export the desired configuration and run some task.
#	It is recommended to create an alias to run this script, like "alias run=bash local_dev_setup/alias_cdp.sh".

source .env/bin/activate

echo What environment do you want to access? Leave it blank for security.env
read security_file
export $(grep -v '^#' security$security_file.env | xargs)

echo Do you want to runserver [r], shell [s], python script [py], apply migrations [mg], show migrations [sm] or quit [q]? 
read task
if [ $task = r ]
then
	python3 your_repo/manage.py runserver
elif [ $task = s ]
then
	python3 your_repo/manage.py shell
elif [ $task = py ]
then
	echo What is the path to your python script?
	read python_script_path
	python3 your_repo/manage.py shell < $python_script_path
elif [ $task = mg ]
then
	python3 your_repo/manage.py migrate
elif [ $task = sm ]
then
	python3 your_repo/manage.py showmigrations
else [ $task = q ]
	echo Quit
fi
