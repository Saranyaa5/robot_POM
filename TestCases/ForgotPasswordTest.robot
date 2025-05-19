*** Settings ***
Library    SeleniumLibrary
Test Setup    open the browser with url
Test Teardown    close the browser session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/DashboardResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/ForgetPasswordResources.robot

*** Test Cases ***
validate Reset Password functionality
    [Tags]    smoke
    LoginResources.Go to Forget your password page
    ForgetPasswordResources.Verify Forgot Your Password Page Opens
    ForgetPasswordResources.Fill the Forgot Password Page
    ForgetPasswordResources.Verify the message

validate cancel functionality
    [Tags]    smoke
    LoginResources.Go to Forget your password page
    ForgetPasswordResources.Verify Forgot Your Password Page Opens
    ForgetPasswordResources.Cancel the Reset Password
    ForgetPasswordResources.Verify that Login Page is displayed
