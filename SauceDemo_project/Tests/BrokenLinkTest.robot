*** Settings ***
Documentation    Check for broken links on SauceDemo (Non-failing version)
Library          SeleniumLibrary
Library          RequestsLibrary
Resource         ../Resources/BrokenLinkResource.robot
Resource         ../Resources/GenericResource.robot
Library          Collections
Library          String

*** Test Cases ***
Verify All Links Are Valid
    Open the browser with url
    Login with valid user id
    Check And Log Broken Links
    close the broswe session

*** Keywords ***
Get All Links
    @{elements}=    Get WebElements    ${TAG_LINK}
    ${links}=       Create List
    FOR    ${el}    IN    @{elements}
        ${href}=    Get Element Attribute    ${el}    href
        ${should_ignore}=    Run Keyword And Return Status
        ...    Should Match Regexp    ${href}    ${IGNORE_PATTERNS}
        Continue For Loop If    '${href}' in ['None', ''] or ${should_ignore}
        ${full_url}=    Set Variable If
        ...    '${href}'.startswith('http')    ${href}
        ...    ${BASE_URL}${href}
        Append To List    ${links}    ${full_url}
    END
    RETURN    ${links}

Check And Log Broken Links
    ${all_links}=    Get All Links
    ${unique_links}=    Remove Duplicates    ${all_links}
    ${broken_links}=    Create List
    
    ${disable_warnings}=    Evaluate    "import urllib3; urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)"
    Create Session    linkcheck    ${BASE_URL}    verify=False
    
    FOR    ${link}    IN    @{unique_links}
        ${status}=    Run Keyword And Return Status
        ...    HEAD On Session    linkcheck    ${link}    timeout=5    allow_redirects=${True}    expected_status=any
        
        IF    not ${status}
            Append To List    ${broken_links}    ${link}
            Log    Broken link found: ${link} (Connection failed)    level=WARN
        ELSE
            ${response}=    GET On Session    linkcheck    ${link}    expected_status=any
            ${status_code}=    Set Variable    ${response.status_code}
            IF    ${status_code} >= 400
                Append To List    ${broken_links}    ${link} => ${status_code}
                Log    Potentially problematic link: ${link} (Status: ${status_code})    level=WARN
            ELSE
                Log    Valid link: ${link} (Status: ${status_code})    level=INFO
            END
        END
    END
    
    Log    \n\n=== Link Check Results ===    level=INFO
    Log    Total links checked: ${unique_links.__len__()}    level=INFO
    Log    Broken/problematic links found: ${broken_links.__len__()}    level=INFO
    IF    ${broken_links}
        Log    \nBroken Links:\n${broken_links}    level=WARN
    ELSE
        Log    All links are valid!    level=INFO
    END