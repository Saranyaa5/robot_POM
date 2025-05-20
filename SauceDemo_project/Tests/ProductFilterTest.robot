*** Settings ***
Documentation     To test product filter functionality with different dropdown options
Library           SeleniumLibrary
Library           Collections
Library           String
Resource          ../Resources/ProductFilterResourcce.robot
Resource          ../Resources/GenericResource.robot
Test Template     Validate the functionality of filter options

*** Variables ***
@{actual_list}

*** Test Cases ***            options                filtered product list
Sort Ascending By name        Name (A to Z)          Sauce Labs Backpack,Sauce Labs Bike Light,Sauce Labs Bolt T-Shirt,Sauce Labs Fleece Jacket,Sauce Labs Onesie,Test.allTheThings() T-Shirt (Red)
Sort Descending By name       Name (Z to A)          Test.allTheThings() T-Shirt (Red),Sauce Labs Onesie,Sauce Labs Fleece Jacket,Sauce Labs Bolt T-Shirt,Sauce Labs Bike Light,Sauce Labs Backpack
Sort Ascending By price       Price (low to high)    $7.99,$9.99,$15.99,$15.99,$29.99,$49.99
Sort Descending By price      Price (high to low)    $49.99,$29.99,$15.99,$15.99,$9.99,$7.99

*** Keywords ***
Validate the functionality of filter options
    [Arguments]    ${options}    ${filtered_product_list}
    Open the browser with url
    Login with valid user id
    Choose the filter option    ${options}
    Check the products are sorted according to the filter    ${filtered_product_list}
    close the broswe session

Choose the filter option
    [Arguments]    ${options}
    Select From List By Label   ${filter_dropdown}    ${options}
    Sleep    1s
    Run Keyword If    '${options}' == 'Name (A to Z)' or '${options}' == 'Name (Z to A)'    Get Names To List
    ...    ELSE    Get Prices To List

Check the products are sorted according to the filter
    [Arguments]    ${filtered_product_list}
    ${expected_list}=    Split String    ${filtered_product_list}    ,
    
    ${is_price_test}=    Run Keyword And Return Status
    ...    Should Contain    ${options}    Price
    
    Run Keyword If    ${is_price_test}
    ...    Compare Price Lists    ${expected_list}
    ...    ELSE
    ...    Compare Name Lists    ${expected_list}

Compare Price Lists
    [Arguments]    ${expected_list}
    ${converted_expected}=    Create List
    ${converted_actual}=    Create List

    FOR    ${item}    IN    @{expected_list}
        ${float_price}=    Convert To Number    ${item}
        Append To List    ${converted_expected}    ${float_price}
    END

    FOR    ${item}    IN    @{actual_list}
        Append To List    ${converted_actual}    ${item}
    END

    Lists Should Be Equal    ${converted_actual}    ${converted_expected}


Compare Name Lists
    [Arguments]    ${expected_list}
    # Log To Console    ${actual_list}
    # Log To Console    ${expected_list}
    Lists Should Be Equal    ${actual_list}    ${expected_list}

Get Names To List
    ${list}=    Create List
    @{elements}=    Get WebElements    ${name_locator}
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        Append To List    ${list}    ${text}
    END
    Set Test Variable    ${actual_list}    ${list}
    # Log To Console    Actual List: ${actual_list}

Get Prices To List
    ${list}=    Create List
    @{elements}=    Get WebElements    ${price_locator}
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        Append To List    ${list}    ${text}
    END
    Set Test Variable    ${actual_list}    ${list}
    # Log To Console    Actual List: ${actual_list}