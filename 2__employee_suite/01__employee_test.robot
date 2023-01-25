*** Settings ***
Documentation     This file contains test case related to valid employee
Resource    ../Resource/Base/Common_functionlities.resource
Library    SeleniumLibrary
Library   DataDriver     file=../test_data/orange_data.xlsx     sheet_name=Add Valid Employee Test

Test Setup      Launch Browser And Navigate to Url
Test Teardown   Close Browser

Test Template    Add Valid Employee Template

*** Test Cases ***
Add Valid Employee test_${test_case}

*** Keywords ***
Add Valid Employee Template
    [Arguments]    ${username}    ${password}     ${fname}   ${m_name}   ${l_name}   ${exp_val1}   ${exp_val2}
    Input Text     name=username     ${username}
    Input Password    name=password    ${password}
    Click Element    xpath=//*[@type='submit']
    Click Element    xpath=//span[text()='PIM']
    Click Element     partial link=Add Employee
    Input Text    name=firstName    ${fname}
    Input Text    name=middleName    ${m_name}
    Input Text    name=lastName    ${l_name}
    Sleep    5s
    Click Element    xpath=//*[@type='submit']
    Sleep    5s
    Element Should Contain    xpath=//h6[contains(normalize-space(),'${fname}')]     ${exp_val1}
    Element Attribute Value Should Be     name=firstName      value      ${exp_val2}

