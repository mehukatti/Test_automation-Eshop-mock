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
    Cart Quantity According To Product Grid    3    Orange
    Open Cart
    Cart View Contains    3    Orange

Add Orange To Cart With Plus
    Open Web App
    Add To Cart    Orange
    Cart Quantity According To Product Grid    1    Orange
    Open Cart
    Cart View Contains    1    Orange

Update Orange Quantity
    Open Web App
    Update Cart Quantity    3    Orange
    Add to Cart    Orange
    Cart Quantity According To Product Grid    4    Orange
    Open Cart
    Cart View Contains    4    Orange

Add And Minus Pineapple Quantity
    Open Web App
    Update Cart Quantity    10    Pineapple
    Minus From Cart    Pineapple
    Cart Quantity According To Product Grid    9    Pineapple
    Open Cart
    Cart View Contains    9    Pineapple

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