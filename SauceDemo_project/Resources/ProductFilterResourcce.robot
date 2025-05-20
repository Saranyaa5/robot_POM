*** Variables ***

# @{filter_options}       Name (A to Z)    Name (Z to A)    Price (low to high)    Price (high to low)

${filter_dropdown}      css:.product_sort_container
${name_locator}         xpath=//div[@data-test='inventory-item-name']
${price_locator}        xpath=//div[@data-test='inventory-item-price']