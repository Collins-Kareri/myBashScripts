#!/bin/bash
number_regex='^[0-9]+$'

read -rp "Enter the port to close: " port

if [[ -z "$port" || ! "$port" =~ $number_regex ]]
then
	echo "You did not enter a valid port value"
	exit
fi

pid=$(sudo lsof -t -i:"$port")

if [[ -z "$pid" ]]
then
	echo "Port number is already open. Nothing to do here."
	exit
fi

echo -e "\n\bThis script uses sudo permission to close port\n\b"

sudo kill $pid

echo "Killing port..."
echo "Port is now available"
