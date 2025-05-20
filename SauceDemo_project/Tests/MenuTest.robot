*** Settings ***
Documentation    To validate the functionality of the elements in menu bar
Library    SeleniumLibrary
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/MenuResource.robot


*** Test Cases ***
Validate Redirection of about button in menu
    Open the browser with url
    Login with valid user id
    Click the about button in menu
    User should see the saucelabs web page
    close the broswe session


*** Keywords ***
Click the about button in menu
     Click Button    ${side_menu}
     Click Element    ${about_button}

User should see the saucelabs web page
    ${actual_title}=    Get Title
    Should Be Equal    ${about_page_title}    ${actual_title}
    
    
    
    


    

    
