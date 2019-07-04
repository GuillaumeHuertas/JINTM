#!/bin/bash

read -p "$a" response

if [ -z $response ] ; then
response="Y"
fi

while [[ "$response" != "Y" && "$response" != "n" ]]
do
echo "Choisissez Y ou n"
read -p "$a" response
done

if [ $response == "n" ] ; then
	echo "$b"
else 
	echo "$c"
fi