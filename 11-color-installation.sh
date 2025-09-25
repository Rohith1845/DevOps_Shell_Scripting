#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error: Please run the script with root privelege"
    exit 1 #Failure other than Zero
fi


validate(){
if [ $1 -ne 0 ]; then
    echo -e "Installing $2 $? Error $N"
    exit 1
else
    echo -e "Installing $2 $G success $N"
fi
}

dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    validate $? "mysql"
else
    echo -e "Mysql already exist...$Y skipping $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    validate $? "nginx"
else
    echo -e "Nginx already exist...$Y skipping $N"
fi

dnf list installed python
if [ $? -ne 0 ]; then
    dnf install python3 -y
    validate $? "python3"
else
    echo -e "python already exist....$Y skipping $N"
fi