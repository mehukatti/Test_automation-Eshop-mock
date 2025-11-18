# https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#toc-entry-586

from robot.libraries.BuiltIn import BuiltIn

def get_webdriver_instance():
    seleniumlib = BuiltIn().get_library_instance('SeleniumLibrary')
    return seleniumlib

def find_product_from_grid(product_name: str):
    seleniumlib = get_webdriver_instance()
    return