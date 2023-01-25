*** Settings ***
Documentation     This file contains test case related to valid login


Resource    ../Resource/Base/Common_functionlities.resource
Library    SeleniumLibrary
Test Setup      Launch Browser And Navigate to Url
Test Teardown    Close Browser
Test Template    valid login Template

*** Test Cases ***
TC1    Admin  admin123   Dashboard
*** Keywords ***
valid login Template
     [Arguments]      ${username}    ${password}   ${expected}
     Input Text     name=username     ${username}
    Input Password    name=password    ${password}
    Click Element    xpath=//*[@type='submit']
    Element Should Contain    xpath=//*[contains(@class,'topbar-header-breadcrumb-module')]        ${expected}