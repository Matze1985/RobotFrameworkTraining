*** Settings ***
Resource    ../FunctionLibrary/Common/CommonFunctions1.robot
Suite Setup    PerformImport

*** Test Cases ***
TC1 - This should fail
    Log    ${data1}

TC2- This should fail
    Log    ${config1}

TC3- This should Pass
    SpecificFunction2