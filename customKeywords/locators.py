from selenium.webdriver.common.by import By

# https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#toc-entry-586
from robot.libraries.BuiltIn import BuiltIn

def get_webdriver_instance():
    seleniumlib = BuiltIn().get_library_instance('SeleniumLibrary')
    return seleniumlib

def find_product_from_grid(product_name: str):
    seleniumlib = get_webdriver_instance()
    return

def add_to_cart(quantity: int, product: str):
    """Add given quantity of the product to the cart"""
    seleniumlib = get_webdriver_instance()
    input_xpath = f"//div[@class='productContainer'][.//*[text()='{product}']]//input"
    input_element = seleniumlib.find_element(input_xpath)
    input_element.clear()
    input_element.send_keys(quantity)

def cart_contains(quantity: int, product: str):
    """Check that the cart contains given quantity of the product."""
    seleniumlib = get_webdriver_instance()
    value = seleniumlib.get_element_attribute(f"//tr[.//*[text()='{product}']]//input", "value")
    assert int(value) == quantity, f"Expected quantity of product was {quantity}"