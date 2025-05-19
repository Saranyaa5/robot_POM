*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${un}    name=user-name
${pw}    name=password
${loginbtn}    id=login-button
${dashText}    xpath=//div[@class='app_logo']
${lockedError}    xpath=//h3