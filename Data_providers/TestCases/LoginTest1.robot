*** Settings ***
Library           SeleniumLibrary
Library           DataDriver    file=../Resources/loginData.csv    encoding=utf_8    dialect=unix
Test Template     Validate unsuccessful Login    

*** Variables ***
${url}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser}        chrome
${login_error_message}    css:.oxd-alert-content--error
${username}
${password}

*** Test Cases ***
Invalid Login with    ${username}    ${password}

*** Keywords ***
Validate unsuccessful Login
    [Arguments]    ${username}    ${password}
    Open the Browser with the URL
    Fill the login form    ${username}    ${password}
    Verify the error message is correct
    Close Browser session

Open the Browser with the URL
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    name=username    ${username}
    Input Password    name=password    ${password}
    Click Button    xpath=//button[@type='submit']
    Wait Until Element Is Visible    ${login_error_message}    timeout=10

Verify the error message is correct
    Element Text Should Be    ${login_error_message}    Invalid credentials

Close Browser session
    Close Browser
