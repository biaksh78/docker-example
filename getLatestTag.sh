#!/bin/bash


if [ "$#" -ne 2 ]
then
  echo "Please provide the registry endpoint and app name as input in the format [localhost:5000 my-app]"
  exit 
fi

registryEndPoint=$1
appName=$2
registryAPIUrl="http://$registryEndPoint/v2/$appName/tags/list"


if which jq >/dev/null; then
    echo "Latest tag for [$appName] found in the registry [$registryAPIUrl]" 

    curl -s $registryAPIUrl | jq -r '.tags[-1]'
else
    echo 'jq installation is required but you can see all the tage below :)'
    curl -s $registryAPIUrl 
fi




