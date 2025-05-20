*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${side_menu}    xpath://button[contains(@id,'react-burger-menu-btn')]
${about_button}    id:about_sidebar_link
${about_page_title}    Sauce Labs: Cross Browser Testing, Selenium Testing & Mobile Testing    