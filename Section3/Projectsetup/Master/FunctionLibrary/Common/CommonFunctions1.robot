*** Settings ***
Library    String

*** Keywords ***
PerformImport
    ${test_suite_name}=    Split String From Right    ${SUITE_NAME}    .    1
    Run Keyword And Ignore Error    Import Variables    Config/${test_suite_name[1]}.py
    Run Keyword And Ignore Error    Import Variables    Testdata/${test_suite_name[1]}.py
    Run Keyword And Ignore Error    Import Variables    Locale/${test_suite_name[1]}_${Locale}.py
    Run Keyword And Ignore Error    Import Resource    FunctionLibrary/Specific/${test_suite_name[1]}Functions.robot    
    