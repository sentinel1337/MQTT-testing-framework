#!/bin/bash

echo ""
echo "+------------------------------------------+"
echo "| MQTT Auto fuzzing                        |"
printf "| %-40s |\n" "`date`"
echo "+------------------------------------------+"


echo ""
echo -e "\e[1;32mTARGET HOST ? \e[0m"
read host
echo -e "\e[1;32mPORT ? \e[0m"
read port
echo -e "\e[1;32mEnter payload file name or path of file \e[0m"
read fuzzlist
echo -e "\e[1;32mThrottle time ? (0 to n seconds) \e[0m"
read speed
echo -e "\e[1;32mCredential ? (y or n) \e[0m"
read cred

if [ "$cred" == "${cred#[Nn]}" ]; then

	echo -e "\e[1;32mUsername ? \e[0m"
	read uname
	echo -e "\e[1;32mPassword ? \e[0m"
	read pword

	echo "--------------------------------------------------------------"
	echo -e "\e[1;33mSending payload with latency of $speed seconds \e[0m"
	echo "--------------------------------------------------------------"



		while read fuzzlist; 
		do

        		sleep $speed
        		echo "Payload: $fuzzlist"

        		mosquitto_pub -h "$host" -p "$port" -t test -m "$fuzzlist" -u "$uname" -P "$pword"
		done< $fuzzlist

else

	echo -e "\e[1;33mSending payload  with latency of $speed seconds \e[0m"
	echo""
	echo "--------------------------------------------------------------"

		while read fuzzlist; 
		do

        		sleep $speed
        		echo "Payload: $fuzzlist"

        		mosquitto_pub -h "$host" -p "$port" -t test -m "$fuzzlist"
		done< $fuzzlist

fi

echo -e "\n===============================================================";
echo -e "\nFeatures:"
echo -e "1. Brute force credentials \n2. Auto fuzzing \n3. Manual fuzzing \n4. Stress test \n5. Broker info"

echo -e "\n-----------------"
echo  -e "\e[1;34mEnter option:\e[0m"
echo "-----------------"
read option

case $option in

  1)
        ./mqttcredentialbruteforce.sh
    ;;

  2)
        ./autofuzz.sh
    ;;
  3)
        ./manualfuzz.sh
    ;;
  4)
        ./thread.sh
    ;;
 5)
        ./info.sh
    ;;

  *)
    echo -n "Please enter correct option"
    ;;
esac
