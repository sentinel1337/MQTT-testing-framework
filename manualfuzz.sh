#!/bin/bash


casec()
{
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

}

echo ""
echo "+------------------------------------------+"
echo "| MQTT manual fuzzing                      |"
printf "| %-40s |\n" "`date`"
echo "+------------------------------------------+"
echo "To exit enter exitnow"
echo ""

echo ""
echo -e "\e[1;32mTARGET HOST ? \e[0m"
read host
echo -e "\e[1;32mPORT ? \e[0m"
read port
echo -e "\e[1;32mTOPIC ? \e[0m"
read topic
echo -e "\e[1;32mCredential ? (y or n) \e[0m"
read cred

if [ "$cred" == "${cred#[Nn]}" ]; then

	echo -e "\e[1;32mUsername ? \e[0m"
	read uname
	echo -e "\e[1;32mPassword ? \e[0m"
	read pword
	echo "----------------------------------------"

		while true;
		do
			echo -e "\e[1;32mENTER PAYLOAD\e[0m"
			read -r fuzzpayload

			if [ "$fuzzpayload" != "exitnow" ]; then
				mosquitto_pub -h "$host" -p "$port" -t "$topic" -m "$fuzzpayload" -u "$uname" -P "$pword"
			else
				casec
			fi
		done

else

		while true;
		do
        		echo -e "\e[1;32mENTER PAYLOAD\e[0m"
        		read -r fuzzpayload

			if [ "$fuzzpayload" != "exitnow" ]; then
        	       		 mosquitto_pub -h "$host" -p "$port" -t "$topic" -m "$fuzzpayload"
      		        else
                		casec
        		fi
		done

fi
