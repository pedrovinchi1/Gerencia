#!/bin/bash

POM_PATH="../../pom.xml"

../../mvnw -f $POM_PATH clean package -DskipTests=true

if [ $? -eq 0 ]; then
  echo "Maven build and Payara Micro start successful."
  
  docker compose up
else
  echo "Maven build or Payara Micro start failed."
  exit 1
fi