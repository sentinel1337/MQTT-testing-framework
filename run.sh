
#!/bin/bash

cat banner
echo  "\e[1;36m------------------------------------------------------------------\e[0m";
echo "+------------------------------------------+"
echo "|\e[1;32m MQTT Broker Testing Framework \e[0m           |"
echo "|                                          |"
printf  "| %-40s |\n" "`date`"
echo "+------------------------------------------+"
echo   "\e[1;36m------------------------------------------------------------------\e[0m";



echo "Features:"
echo "1. Brute force credentials \n2. Auto fuzzing \n3. Manual fuzzing \n4. Stress test \n5. Broker info"

echo  "\n-----------------"
echo   "\e[1;34mEnter option:\e[0m"
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
