*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${URL}    https://mehukatti.github.io/mock_web_app/
${BROWSER}        Chrome

*** Test Cases ***
Web App Functional
    Open Web App

*** Keywords ***
Open Web App
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Mock Web App