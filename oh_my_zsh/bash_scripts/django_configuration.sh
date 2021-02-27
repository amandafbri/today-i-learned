#!/bin/bash
​
source .env/bin/activate
​
echo What environment do you want to access? Leave it blank for security.env
read security_file
export $(grep -v '^#' security$security_file.env | xargs)
​
echo Do you want to runserver [r], shell [s] or quit [q]? 
read task
if [ $task = r ]
then
	python3 central_data_provider/manage.py runserver
elif [ $task = s ]
then
	python3 central_data_provider/manage.py shell
else [ $task = q ]
	echo Quit
fi