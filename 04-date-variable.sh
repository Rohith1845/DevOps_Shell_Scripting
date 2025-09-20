#!/bin/bash

#date=$(date)

START_DATE=$(date+%s)

sleep 10

END_DATE=$(date+%s)

TOTAL_DATE=$(($END_DATE-$START_DATE))

echo "time stamp in $TOTAL_DATE seconds"