*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${login_error}    xpath=//div[@class='oxd-alert-content oxd-alert-content--error']/p
${missing_username}    xpath=(//div[@class='oxd-input-group oxd-input-field-bottom-space'])[1]/span   
${missing-password}    xpath=//div[@class='oxd-input-group oxd-input-field-bottom-space']/span
${forget_pw}    xpath=//p[@class='oxd-text oxd-text--p orangehrm-login-forgot-header']
${dashboard}    xpath=//h6

*** Keywords ***
fill the login form
    [Arguments]    ${un}    ${pw}
    Input Text    xpath=//input[@name='username']    ${un}
    Input Password    xpath=//input[@name='password']    ${pw}
    Click Button    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--main orangehrm-login-button']
    Sleep    5

verify the error message is correct
    Element Text Should Be    ${login_error}    Invalid credentials

verify the error message is displayed for username
    Element Text Should Be    ${missing_username}    Required

verify the error message is displayed for password
    Element Text Should Be    ${missing-password}    Required

Go to Forget your password page
    Click Element    ${forget_pw}    


