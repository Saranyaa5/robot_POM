*** Settings ***
Documentation     Login test using CSV data
Library           SeleniumLibrary
Library           DataDriver    file=LoginData.xl
Test Template     Validate Unsuccessful Login

*** Test Cases ***
Login to form using    ${Username}    ${Password}

*** Keywords ***
Validate Unsuccessful Login
    [Arguments]    ${Username}    ${Password}
    Open the Browser with the URL
    Fill the login form    ${Username}    ${Password}
    Verify the error message
    Close Browser

Open the Browser with the URL
    Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Fill the login form
    [Arguments]    ${Username}    ${Password}
    Input Text    name=username    ${Username}
    Input Password    name=password    ${Password}
    Click Button    xpath=//button[@type='submit']
    Sleep    2

Verify the error message
    Page Should Contain    Invalid credentials
