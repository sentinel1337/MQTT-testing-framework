# MQTT Testing automation - BETA


A MQTT testing automation which can help developers/tester to test MQTT brokers, Applications and end-devices. Features are Credential brute force, Auto fuzzing, Manual fuzzing, Stress testing and Information gathering currentl.

#### Installation:

1) Mosquitto client.
 

- sudo apt-add-repository ppa:mosquitto-dev/mosquitto-ppa
- sudo apt-get update
- sudo apt-get install mosquitto
- sudo apt-get install mosquitto-clients
- sudo apt clean


2) Parallel.
- sudo apt install parallel

Note: mosquitto_sub, mosquitto_pub and parallel should be globally accessed in
CLI.

3) Copy all the 7 bash script in one directory of Unix system, give execute permission
and ready to use.

#### Dependencies 
- A command line utility “Parallel” (Used to orchestrate bots in stress test)
- Eclipse mosquitto client (Used to communicate to brokers)


#### Usage

` ./run.sh  `

And just answer the asked questions.
