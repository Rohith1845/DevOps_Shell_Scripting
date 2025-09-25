#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error: Please run the script with root privelege"
    exit 1 #Failure other than Zero
fi


validate(){
if [ $1 -ne 0 ]; then
    echo "Error: in installing $2 package"
    exit 1
else
    echo "Installing $2 package success"
fi
}

dnf install mysql -y
validate $? "mysql"

dnf install nginx -y
validate $? "Nginx"

dnf install python3 -y
validate $? "Python3"
