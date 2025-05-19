*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/LoginData.xlsx    sheet_name=Sheet1  
Resource    ../SauceDemo_Resources/CommonResources.robot
Resource    ../SauceDemo_Resources/LoginResources.robot
Test Template    Validate Successful Login    

*** Variables ***
${Username}
${Password}

*** Test Cases ***
Invalid Login with    ${Username}    ${Password}

*** Keywords ***
Validate Successful Login
    [Arguments]    ${Username}    ${Password}
    Open the browser with url
    fill the login form    ${Username}    ${Password}
    IF    '${Username}'=='locked_out_user'
        verify locked out error
    ELSE    
        verify the dash board Page    
    END
    close the broswe session

fill the login form
    [Arguments]    ${Username}    ${Password}
    Input Text    ${un}    ${Username}
    Input Password    ${pw}    ${Password}
    Click Button    ${loginbtn}
    Sleep    5

verify the dash board Page
    Element Text Should Be    ${dashText}    Swag Labs

verify locked out error
    Element Text Should Be    ${lockedError}    Epic sadface: Sorry, this user has been locked out.