#!/bin/bash


echo ""
echo "+------------------------------------------+"
echo "| MQTT Broker Information                  |"
printf "| %-40s |\n" "`date`"
echo "+------------------------------------------+"
echo ""
echo -e "\e[1;32mTARGET HOST ?\e[0m"
read host
echo -e "\e[1;32mPORT ? \e[0m"
read port
echo -e "\e[1;32mSubscribe  time ? (1 to 60 seconds) \e[0m"
read waitingtime
echo -e "\e[1;32mCredentials ? (y or n) \e[0m"
read cred


if [ "$cred" == "${cred#[Nn]}" ]; then

        echo -e "\e[1;32mUsername ? \e[0m"
        read uname
        echo -e "\e[1;32mPassword ? \e[0m"
        read pword

		echo "----------------------------"
		echo -e "\e[1;36mVersion:\e[0m"
            	mosquitto_sub -p "$port" -h "$host"  -t '$SYS/broker/version'  -W "$waitingtime"  -u "$uname" -P "$pword" --quiet
            	echo "----------------------------"
            	echo -e "\e[1;36mBroker Uptime:\e[0m"
            	mosquitto_sub -p "$port" -h "$host"  -t '$SYS/broker/uptime'  -W "$waitingtime"  -u "$uname" -P "$pword" --quiet
            	echo "----------------------------"
            	echo -e "\e[1;36mSubscribe count:\e[0m"
            	mosquitto_sub -p "$port" -h "$host"  -t '$SYS/broker/subscriptions/count'  -W "$waitingtime"  -u "$uname" -P "$pword" --quiet
            	echo "----------------------------"
            	echo -e "\e[1;36mClient connected:\e[0m"
            	mosquitto_sub -p "$port" -h "$host"  -t '$SYS/broker/clients/connected'  -W "$waitingtime"  -u "$uname" -P "$pword" --quiet
            	echo "----------------------------"
            	echo -e "\e[1;36mAll time clients:\e[0m"
            	mosquitto_sub -p "$port" -h "$host"  -t '$SYS/broker/clients/maximum'  -W "$waitingtime"  -u "$uname" -P "$pword" --quiet
            	echo "----------------------------"


else

                echo "----------------------------"
                echo -e "\e[1;36mVersion:\e[0m"
                mosquitto_sub -p "$port" -h "$host"  -t '$SYS/broker/version'  -W "$waitingtime"   --quiet
                echo "----------------------------"
                echo -e "\e[1;36mBroker Uptime:\e[0m"
                mosquitto_sub -p "$port" -h "$host"  -t '$SYS/broker/uptime'  -W "$waitingtime"   --quiet
                echo "----------------------------"
                echo -e "\e[1;36mSubscribe count:\e[0m" 
                mosquitto_sub -p "$port" -h "$host"  -t '$SYS/broker/subscriptions/count'  -W "$waitingtime"   --quiet
                echo "----------------------------"
                echo -e "\e[1;36mClient connected:\e[0m"  
                mosquitto_sub -p "$port" -h "$host"  -t '$SYS/broker/clients/connected'  -W "$waitingtime"   --quiet
                echo "----------------------------"
                echo -e "\e[1;36mAll time clients:\e[0m" 
                mosquitto_sub -p "$port" -h "$host"  -t '$SYS/broker/clients/maximum'  -W "$waitingtime"   --quiet
                echo "----------------------------"
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

