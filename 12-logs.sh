#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
mkdir -p $LOGS_FOLDER
LOGS_FOLDER="/var/logs/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

echo "Script started executed at: $(date)"

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

dnf list installed mysql &>>LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>LOG_FILE
    validate $? "mysql"
else
    echo -e "Mysql already exist...$Y skipping $N"
fi

dnf list installed nginx &>>LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>LOG_FILE
    validate $? "nginx"
else
    echo -e "Nginx already exist...$Y skipping $N"
fi

dnf list installed python3 &>>LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>LOG_FILE
    validate $? "python3"
else
    echo -e "python already exist....$Y skipping $N"
fi