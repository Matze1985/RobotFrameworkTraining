** Settings ** 	  	  	  	 
Library    RequestsLibrary
Library    OperatingSystem

** Test Cases ** 
TC1 - Get request	  	  	 
    Create Session 	google 	http://www.google.com 	 
    ${response}= 	Get Request 	google 	/
    Should Be Equal As Strings 	${response.status_code} 	200 	 

TC2 - Get request using outbound proxies	  	  	 
    ${proxies}= 	Create Dictionary 	http=http://acme.com:912 	https=http://acme.com:913
    Create Session 	google 	http://www.google.com    proxies=${proxies}
    ${response}= 	Get Request 	google 	/
    Should Be Equal As Strings 	${response.status_code} 	200
  	
TC3 - Get request using cookies	  	  	 
    ${cookies}= 	Create Dictionary 	cookie1=111 	cookie2=222
    Create Session 	google 	http://www.google.com    cookies=${cookies}
    ${response}= 	Get Request 	google 	/
    Should Be Equal As Strings 	${response.status_code} 	200
  	  	  	  	   	
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

TC6 - Post request
    Create Session  uri  http://127.0.0.1:5000
    ${data}= 	Create Dictionary 	user=admin    pwd=admin
    ${resp}=  Post Request  uri  /api/login    json=${data}    
    Log    ${resp.text}