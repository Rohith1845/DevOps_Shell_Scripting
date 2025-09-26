#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "Error: Please run the script with root privelege"
    exit 1 #Failure other than Zero
fi

validate(){
    if [ $1 -ne 0 ]; then
        echo "Installing $2 is $R FAILURE $N" | tee -a $LOG_FILE
    else
        echo "Installing $2 is $G Success $N" | tee -a $LOG_FILE
    fi
}

for package in $@
do
    dnf list installed $package &>>LOG_FILE

    if [ $? -ne 0 ]; then
        dnf install $package -y &>>LOG_FILE
        validate $? "$package"
    else
        echo "$package already installed...$Y skipping $N"
    fi
done