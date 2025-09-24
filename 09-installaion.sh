#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error: Please run the script with root privelege"
    exit 1 #Failure other than Zero
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Error: in installing mysql package"
    exit 1
else
    echo "Installing mysql package success"
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo  "Error: in installing nginx package"
    exit 1
else
    echo "Installing nginx successfull"
fi

dnf install mongo-mongosh -y

if [ $? -ne 0 ]; then
    echo  "Error: in installing  package"
    exit 1
else
    echo "Installing nginx successfull"
fi
