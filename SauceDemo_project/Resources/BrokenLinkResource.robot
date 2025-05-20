*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${VALID_STATUS}    200
${TAG_LINK}       xpath=//a
${BASE_URL}       https://www.saucedemo.com
${IGNORE_PATTERNS}    ^#|^javascript:|^mailto:|^tel:

