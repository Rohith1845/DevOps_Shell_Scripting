#!/bin/bash

NUMBER1=100
NUMBER2=150
NAME=DevOps

SUM=$(($NUMBER1+$NUMBER2+$NAME))

echo "sum is: ${sum}"

#size =3, max index=2
LEADERS=("PAVAN" "ROHITH" "KALYAN")

echo "All leaders: ${LEADERS[@]}"
echo "First leader: ${LEADERS[0]}"
echo "First leader: ${LEADERS[10]}"
