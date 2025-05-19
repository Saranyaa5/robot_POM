*** Settings ***
Library    SeleniumLibrary
Test Template   Validate unscuccessful Login 

*** Test Cases ***       username         password
Invalid username         adm               admin123
Invalid password         Admin             adm    
Special characters       @134              1234
Invalid username pass    123               admin

*** Variables ***
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser}    chrome

*** Keywords ***
Validate unscuccessful Login
    [Arguments]    ${username}    ${password}
    Open the Browser with the URL
    Fill the login form    ${username}    ${password}
    Close Browser session

Open the Browser with the URL
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    5
Close Browser session
    Close Browser

Fill the login form
    [arguments]    ${username}    ${password}
    Input Text    name=username    ${username}
    Input Password    name=password    ${password}
    Click Button    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--main orangehrm-login-button']
    Sleep    5