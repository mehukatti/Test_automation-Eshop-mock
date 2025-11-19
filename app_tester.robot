*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Library           customKeywords/locators.py
Suite Teardown    Close All Browsers

*** Variables ***
${URL}    https://mehukatti.github.io/mock_web_app/
${BROWSER}        Chrome

*** Test Cases ***
Web App Functional
    Open Web App

View Empty Cart
    Open Web App
    Open Cart
    Cart Is Empty

Add Orange To Cart
    Open Web App
    Update Cart Quantity    3    Orange
    Open Cart
    Cart Contains    3    Orange

Add Orange To Cart With Plus
    Open Web App
    Add To Cart    Orange
    Open Cart
    Cart Contains    1    Orange

*** Keywords ***
Open Web App
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Mock Web App

Open Product Grid
    # Go back to the home view, where all the products are
    Click Element    //a[@href='index.html']

Open Cart
    Click Element    //a[@href='shoppingCart.html']

Cart Is Empty
    # Fails if cart is not empty
    Page Should Contain    Your shopping cart is empty.