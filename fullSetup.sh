#!/bin/bash

echo "Starting the full setup of the MBDAInstance"
echo "-------------------------------------------"

echo "Starting Java 11 setup"
echo "-------------------------------------------"
source java11Setup.sh
echo "Done Java 11 setup"
echo "-------------------------------------------"

echo "Starting MongoDb setup"
echo "-------------------------------------------"
source mongoDBSetup.sh
echo "Done MongoDb setup"
echo "-------------------------------------------"

echo "Starting Docker setup"
echo "-------------------------------------------"
source dockerSetup.sh
echo "Done Docker setup"
echo "-------------------------------------------"

echo "Remote Desktop setup"
echo "-------------------------------------------"
source remoteDesktopSetup.sh
echo "Done Remote Desktop setup"
echo "-------------------------------------------"
