** Settings ** 	  	  	  	 
Library    RequestsLibrary
Library    OperatingSystem

** Test Cases ** 	  	  	  	   	
TC4 - Post request
    Create Session  uri  http://localhost:3000
  	${data}= 	Create Dictionary 	a=1    b=2
  	${params}= 	Create Dictionary 	c=2    d=3
    ${file_data}=  Get Binary File  ${CURDIR}${/}car.json
    &{files}=  Create Dictionary  file=${file_data}
    ${resp}=  Post Request  uri  /dolphins  files=${files}    data=${data}    params=${params}    
    Log    ${resp}
    Should Be Equal As Strings  ${resp.status_code}  200
    
TC5 - Get request with data and params
  	Create Session 	uri 	http://localhost:3000
    ${data}= 	Create Dictionary 	a=1    b=2
  	${params}= 	Create Dictionary 	c=2    d=3 	 
  	${response}= 	Get Request 	uri 	/answer    data=${data}    params=${params}
  	Should Be Equal As Strings 	${response.status_code} 	200