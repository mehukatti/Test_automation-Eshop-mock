*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Library           customKeywords/locators.py

*** Variables ***
${URL}    https://mehukatti.github.io/mock_web_app/
${BROWSER}        Chrome

*** Test Cases ***
Web App Functional
    Open Web App

Add Orange To Cart
    Open Web App
    Open Cart
    Cart is empty
    Find Product From Grid    Orange

*** Keywords ***
Open Web App
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Mock Web App

Open Cart
    Click Element    //a[@href='shopping_cart.html']

Cart is empty
    # Fails if cart is not empty
    Page Should Contain    Your shopping cart is empty.