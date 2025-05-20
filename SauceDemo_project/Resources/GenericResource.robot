*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/LoginResource.robot

*** Variables ***
${url}    https://www.saucedemo.com/
${browser}    chrome
${base_user}    standard_user    
${base_pass}    secret_sauce
${side_menu}    xpath://button[contains(@id,'react-burger-menu-btn')]    

# *** Keywords ***
# Open the browser with url
#     Open Browser    ${url}    ${browser}
#     Maximize Browser Window
#     Set Selenium Implicit Wait    5

*** Keywords ***
Open the browser with url
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --incognito
    Create WebDriver    Chrome    options=${options}
    Go To    ${url}
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Login with valid user id
    Input Text    ${username_input_feild}    ${base_user}
    Input Password    ${password_input_feild}    ${base_pass}
    Click Button    ${loginbtn}
    
close the broswe session
    Close Browser