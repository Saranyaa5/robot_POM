*** Settings ***
Library    SeleniumLibrary
Test Setup    open the browser with url
Test Teardown    close the browser session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/DashboardResources.robot
Resource    ../Resources/LoginResources.robot

*** Test Cases ***
validate unsuccessful login using invalid credentials
    LoginResources.fill the login form    ${valid_un}    ${invalid_pw}
    LoginResources.verify the error message is correct

validate unsuccessful login for blank username
    LoginResources.fill the login form    ${blank_un}    ${valid_pw}
    LoginResources.verify the error message is displayed for username

validate unsucessful login for black password
    LoginResources.fill the login form    ${valid_un}    ${blank_pw}
    LoginResources.verify the error message is displayed for password

validate successful login
    LoginResources.fill the login form    ${valid_un}    ${valid_pw}
    Sleep    5
    DashboardResources.verify dashboard page opens
