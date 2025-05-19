*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${valid_un}    Admin
${valid_pw}    admin123
${invalid_un}    1234
${invalid_pw}    675434
${blank_un}     
${blank_pw}     
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser}    chrome

*** Keywords ***
open the browser with url
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    5
close the browser session
    Close Browser