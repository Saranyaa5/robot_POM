*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${username_input_feild}    name=user-name
${password_input_feild}    name=password
${loginbtn}    id=login-button
${dashText}    xpath=//div[@class='app_logo']
${lockedError}    xpath=//h3