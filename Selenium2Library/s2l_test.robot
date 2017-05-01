*** Settings ***
| Library      | Selenium2Library
#| Library      | Remote | http://${ADDRESS}:${PORT}

*** Variables ***
| ${ADDRESS}   | 127.0.0.1
| ${PORT}      | 8270



*** Test Cases ***
| 001 Simple Chrome Test
| | Open Browser | http://www.google.com | chrome
| | Wait Until Element Is Visible | 
| | ... | xpath=//input[@id='lst-ib']
| | Input Text |
| | ... | xpath=//input[@id='lst-ib'] |
| | ... | I Love Python
#| | Wait Until Element Is Visible | xpath=//button[@type='submit']
#| | Click Button | xpath=//button[@type='submit']
| | Press Key | id=lst-ib | ENTER
| | Wait Until Page Contains | I Love Python
| | Log Source
| | Capture Page Screenshot
| | Close All Browsers

| 002 Simple Firefox Test
| | Open Browser | http://www.google.com | firefox
| | Wait Until Element Is Visible | 
| | ... | xpath=//input[@id='lst-ib'] | 10
| | Input Text |
| | ... | xpath=//input[@id='lst-ib'] |
| | ... | I Love Python
#| | Wait Until Element Is Visible | xpath=//button[@type='submit']
#| | Click Button | xpath=//button[@type='submit']
| | Press Key | id=lst-ib | ENTER
| | Wait Until Page Contains | I Love Python
| | Log Source
| | Capture Page Screenshot
| | Close All Browsers

| 003 Simple PhantomJS Test
| | Open Browser | http://www.google.com | phantomjs
| | Wait Until Element Is Visible | name=q | 10
| | Input Text | name=q | I Love Python
| | Press Key  | name=q | ENTER
| | Wait Until Page Contains | I Love Python
| | Log Source
| | Capture Page Screenshot
| | Close All Browsers

#| 004 Simple Internet Explorer Test
| | Open Browser | http://www.google.com | ie
| | Wait Until Element Is Visible | xpath=//input[@title="Suche"] | # search input field
| | Input Text | xpath=//input[@title="Suche"] | I Love Python
| | Wait Until Element Is Visible | xpath=//button[@class='lsb']
| | Click Button | xpath=//button[@class='lsb']
| | Wait Until Page Contains | I Love Python
| | Close All Browsers

#| 005 Simple Safari Test
| | Open Browser | http://www.google.com | safari | C:\Program Files (x86)\Safari\Safari.exe
| | Wait Until Element Is Visible | xpath=//input[@title="Suche"] | # search input field
| | Input Text | xpath=//input[@title="Suche"] | I Love Python
| | Wait Until Element Is Visible | xpath=//button[@class='lsb']
| | Click Button | xpath=//button[@class='lsb']
| | Wait Until Page Contains | I Love Python
| | Close All Browsers