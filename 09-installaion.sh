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

dnf install MySQL -y
validate $? "mysql"

dnf install Nginx -y
validate $? "Nginx"

dnf install Python3 -y
validate $? "Python3"
