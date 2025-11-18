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
    Add To Cart    Orange    3
    Open Cart
    Cart contains    Orange    3

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
    [Arguments]     ${product}    ${quantity}
    Page Should Contain Element    //tr[.//*[text()='${product}']]/th[4][text()='${quantity} kg']

Add To Cart
    # Add given Product to shopping cart
    [Arguments]     ${product}    ${quantity}
    Page Should Contain Element    //div[@class='productContainer'][.//*[text()='${product}']]

    # Change the quantity
    Clear Element Text  xpath=//div[@class='productContainer'][.//*[text()='${product}']]//input
    Press Keys    //div[@class='productContainer'][.//*[text()='${product}']]//input    ${quantity}

    # Add to cart
    Click Button    //div[@class='productContainer'][.//*[text()='${product}']]//button