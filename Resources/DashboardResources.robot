*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${dash_title}    xpath=//h6

*** Keywords ***
verify dashboard page opens
    Element Text Should Be    ${dash_title}    Dashboard