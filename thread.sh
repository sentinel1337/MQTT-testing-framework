#!/bin/bash

echo ""
echo "+------------------------------------------+"
echo "| MQTT Stress test                         |"
printf "| %-40s |\n" "`date`"
echo "+------------------------------------------+"
echo ""
echo -e "\e[1;32mTARGET HOST ? \e[0m"
read host
echo -e "\e[1;32mPORT ? \e[0m"
read port
echo -e "\e[1;32mTopic ? \e[0m"
read topic
echo -e "\e[1;32mMessage/Payload file ? \e[0m"
read listfile
echo -e "\e[1;32mBOTS ? \e[0m"
read bots
echo -e "\e[1;32mTHREAD ? \e[0m"
read thread
echo -e "\e[1;32mCredential ? (y or n) \e[0m"
read cred

if [ "$cred" == "${cred#[Nn]}" ]; then
	echo -e "\e[1;32mUsername ? \e[0m"
	read uname
	echo -e "\e[1;32mPassword ? \e[0m"
	read pword

              echo "mosquitto_pub -p $port -h $host  -t $topic  -u $uname -P $pword" >stress.sh
	      echo "mosquitto_sub -p $port -h $host  -t $topic  -u $uname -P $pword" > comparesub.sh
else

              echo " mosquitto_pub -p $port -h $host  -t $topic" >stress.sh 
	      echo "mosquitto_sub -p $port -h $host  -t $topic" > comparesub.sh
fi


chmod 777 comparesub.sh

echo -e "\e[1;32mRun ./listener.sh in other tab \e[0m"
echo "If done hit y"
read ans

if [ "$ans" != "${ans#[Yy]}" ]; then

	echo -e "\e[1;34mRunning...\e[0m"

	l=$bots

		for i in $(seq 1 "$l")
		do
  			echo "$listfile">>file.txt
		done

parallel -j $thread ./stresstest.sh < file.txt

echo ""
echo -e "\e[1;31m\n-----------------------\e[0m"
echo -e "\e[1;32mRESULT\e[0m"
echo -e "\e[1;31m-----------------------\e[0m"
echo -e "\e[1;34mSent messages:\e[0m"
cat sent | wc -l
echo -e "\e[1;34mReceived messages:\e[0m"
cat received | wc -l

rm file.txt
rm stress.sh
rm comparesub.sh
rm sent
rm received
else

	echo "Run lister script first"

fi

echo -e "\n==============================================================="
echo "Features:"
echo -e "1. Brute force credentials \n2. Auto fuzzing \n3. Manual fuzzing \n4. Stress test \n5. Broker info"

echo  -e "\n-----------------"
echo   -e "\e[1;34mEnter option:\e[0m"
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
