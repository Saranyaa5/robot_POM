*** Settings ***
Documentation    To validate the successfull login in sauce demo website
Library    SeleniumLibrary
Library    DataDriver    file=../Test_Data/LoginData.xlsx    sheet_name=Sheet1
Resource    ../Resources/GenericResource.robot
Test Template    Validate Successful Login    

*** Variables ***
${username}
${password}

*** Test Cases ***
validate Login with    ${username}    ${password}

*** Keywords ***
Validate Successful Login
    [Tags]    smoke
    [Arguments]    ${username}    ${password}
    Open the browser with url
    Log    login with ${username} ${password}
    Log To Console    login with ${username} ${password}
    fill the login form    ${Username}    ${Password}
    IF    '${Username}'=='locked_out_user'
        verify locked out error
    ELSE    
        verify the dash board Page    
    END
    close the broswe session

fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    ${username_input_feild}    ${Username}
    Input Password    ${password_input_feild}    ${Password}
    Click Button    ${loginbtn}
    Sleep    5

verify the dash board Page
    Element Text Should Be    ${dashText}    Swag Labs

verify locked out error
    Element Text Should Be    ${lockedError}    Epic sadface: Sorry, this user has been locked out.