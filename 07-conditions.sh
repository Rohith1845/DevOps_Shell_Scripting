#!/bin/bash

NUMBER=$1

if [ $NUMBER -lt 10 ]; then
    echo "Given number $NUMBER is less than 10"
elif[ $NUMBER -gt 10 ]; then
    echo "Given number $NUMBER is greater than 10"
elif[ $NUMBER -ne 10 ]; then
    echo " Given number $NUMBER is not equals to 10"
else 
    echo "Given number $NUMBER is equals to 10"
fi