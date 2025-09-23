#!/bin/bash

NUMBER=$1

if [$NUMBER -lt 10]; then

    echo "Given number is $NUMBER less than 10"
else
    echo "Given number is $NUMBER greater tha 10"
fi