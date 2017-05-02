*** Settings ***
Documentation     Integrating Selenium, Sikuli into Robot Framework
Test Setup        Login To Yahoo Mail    ${user_name}    ${password}
Test Teardown     Tear Test Down
Library           Selenium2Library    15    # Selenium library
Library           Remote    http://localhost:${port}    # Sikuli
Library           Screenshot    # Taking screenshots when a test fails
Resource          resource.html

*** Variables ***
${url}            http://mail.yahoo.com    # Yahoo mail URL
${browser}        ff    # Browser
${user_name}      fotzen_user    # User name
${password}       fotzen_password    # Password
${port}           8270    # Default port number for the remote server
${data_path}      ../robot/data    # Sikuli images
${similarity}     0.85    # Used in Sikuli image comparison
${timeout}        15    # Time to wait for objects

*** Testcases ***
login To Yahoo Mail Test Case
    Wait Until Page Contains Element    UHSearchBox    ${timeout}
    Input Text    UHSearchBox    ENGLISH
    Object Exists    ${data_path}/search_box_left.png    ${similarity}    ${timeout}

*** Keywords ***
Login To Yahoo Mail
    [Arguments]    ${user}    ${pass}
    [Documentation]    This keyword logs user into Yahoo mail
    Internet Explorer Starten    http://mail.yahoo.com
    Wait Until Page Contains Element    username
    Input Text    username    ${user}
    Input Password    passwd    ${pass}
    Click Button    .save
    Wait Until Page Contains Element    toolbar
    Click Object    ${data_path}\\home.png    ${timeout}    ${similarity}
    Sleep    1

Tear Test Down
    Run Keyword If Test Failed    Take Screenshot
    Close All Browsers
