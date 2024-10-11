#!/bin/bash
# Shell Script to monitor a micro-service with its health url
healthURL=http://127.0.0.1:5000/getCreds
httpStatusCode=$(curl -s -X GET -w "%{http_code}" ${healthURL} | awk 'NR==5 ')
if [[ ${httpStatusCode} -eq 200 ]]; then
   echo "Microservice url ${healthURL} is up and running fine"
   echo "$(curl -s -v http://127.0.0.1:5000/getCreds)" | tee -a /var/tmp/BashLogDir/apiCurlOut.log
   exit 0
else
   echo "Microservice url ${healthURL} is DOWN"
fi
