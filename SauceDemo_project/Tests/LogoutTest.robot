*** Settings ***
Documentation    To validate the successful logout after login
Library    SeleniumLibrary
Resource    ../Resources/LogoutResource.robot
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/MenuResource.robot


*** Test Cases ***
logout after successful login
    Open the browser with url
    Login with valid user id
    click the logout button
    User should be in login page
    close the broswe session

*** Keywords ***
click the logout button
    Click Button    ${side_menu}
    Click Element    ${logout_button}

User should be in login page
    Page Should Contain Button    ${loginbtn}

    

    
