*** Settings ***
Library    SeleniumLibrary
Library    DataDriver

*** Variables ***
${url}    https://www.saucedemo.com/
${browser}    chrome

*** Keywords ***
Open the browser with url
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    5
    
close the broswe session
    Close Browser