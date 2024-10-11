#!/bin/bash
# Execute curl -v command to know the success code
# curl -v  http://127.0.0.1:5000/getCreds
#
statusCode=$(curl -s -w "%{http_code}" -X GET http://127.0.0.1:5000/getCreds -o myinfo.json)
if [[ ${statusCode} -eq 200 ]] ; then
   echo "REST API executed successfully"
   cat myinfo.json
else
   echo "Failed"
fi

#Step1:
# Open a separate terminal session and execute below command.
# python3 /root/bash_automation/sampleRESTApi.py

#Step2:
# Execute curl -v command to know the success code
# curl -v  http://127.0.0.1:5000/getCreds
<< mycomm
[root@ansible-control-node bash_automation]# curl -v  http://127.0.0.1:5000/getCreds
< HTTP/1.0 200 OK       -------------------------------------------------------------> # 200 OK is the success code here
[root@ansible-control-node bash_automation]#
mycomm

#Step3
# Sometimes we need to pass some data in the API.
<< mycomms
 [root@ansible-control-node bash_automation]# curl -X GET --header 'Content-Type: application/json' 'http://127.0.0.1:5000/upper' --data '{"input": "abcd"}'
{
  "input": "ABCD"
}
[root@ansible-control-node bash_automation]#
mycomms
