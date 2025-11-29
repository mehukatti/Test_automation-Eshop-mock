from robot.api.deco import keyword

# https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#toc-entry-586
from robot.libraries.BuiltIn import BuiltIn

def _get_webdriver_instance():
    seleniumlib = BuiltIn().get_library_instance('SeleniumLibrary')
    return seleniumlib

"""Quantity in cart can be seen from the input field in all different pages"""

def _check_value_is_expected(xpath, expected_value):
    seleniumlib = _get_webdriver_instance()
    value = seleniumlib.get_element_attribute(xpath, "value")
    assert int(value) == expected_value, f"Expected value was {expected_value}; Got {value}."

@keyword("Cart Quantity According To Product Grid")
def cart_quantity_according_to_product_grid(quantity: int, product: str):
    """Check that the cart contains given quantity of the product
    by checking the input value in product grid"""
    _check_value_is_expected(
        f"//div[@class='productContainer'][.//*[text()='{product}']]//input",
        quantity
    )

@keyword("Cart View Contains")
def cart_view_contains(quantity: int, product: str):
    """Check that the cart contains given quantity of the product."""
    _check_value_is_expected(
        f"//tr[.//*[text()='{product}']]//input",
        quantity
    )

"""There is two ways to edit the cart contents.
1. Input field
2. Plus and minus buttons
"""
@keyword("Update Cart Quantity")
def update_cart_quantity(quantity: int, product: str):
    """Add given quantity of the product to the cart"""
    seleniumlib = _get_webdriver_instance()
    input_element = seleniumlib.find_element(
        f"//div[@class='productContainer'][.//*[text()='{product}']]//input"
    )
    input_element.clear()
    input_element.send_keys(quantity)

@keyword("Add to Cart")
def add_to_cart(product:str):
    """Use plus button to add product to cart."""
    seleniumlib = _get_webdriver_instance()
    plus_button = seleniumlib.find_element(
        f"//div[@class='productContainer'][.//*[text()='{product}']]//button/i[@class='bi bi-plus']"
    )
    plus_button.click()

@keyword("Minus From Cart")
def minus_from_cart(product:str):
    """Use minus button to remove one unit of the product to cart."""
    seleniumlib = _get_webdriver_instance()
    plus_button = seleniumlib.find_element(
        f"//div[@class='productContainer'][.//*[text()='{product}']]//button/i[@class='bi bi-dash']"
    )
    plus_button.click()