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

Cart Is Empty
    Open Web App
    Open Cart
    Cart is empty

Add Orange To Cart
    Open Web App
    Add To Cart    Orange
    Open Cart
    Cart contains    Orange

*** Keywords ***
Open Web App
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Mock Web App

Open Product Grid
    # Go back to the home view, where all the products are
    Click Element    //a[@href='index.html']

Open Cart
    Click Element    //a[@href='shopping_cart.html']

Cart is empty
    # Fails if cart is not empty
    Page Should Contain    Your shopping cart is empty.

Cart contains
    [Arguments]     ${product}
    Page Should Contain Element    //tr[.//*[text()='${product}']]

Add To Cart
    # Add given Product to shopping cart
    [Arguments]     ${product}
    Page Should Contain Element    //div[@class='productContainer'][.//*[text()='${product}']]
    Click Button    //div[@class='productContainer'][.//*[text()='${product}']]//button