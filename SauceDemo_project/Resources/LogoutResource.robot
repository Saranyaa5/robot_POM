*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${logout_button}    xpath://a[contains(@id,'logout_sidebar_link')]
${url_after_logout}    https://www.saucedemo.com/