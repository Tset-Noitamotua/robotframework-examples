# Robot Framework

*** Settings ***

Metadata    Version    0.1.0
Metadata    Author    *Tset Noitamotua*
Metadata    Created    2019-02-08

Library    OperatingSystem			
Library    String			



*** Test Cases ***

Example Of Looping Over The Lines In A File
    ${contents}=    Get File    ${CURDIR}/data.txt	
    @{lines}=    Split To Lines    ${contents}	
    :FOR    ${line}    IN    @{lines}
     \    log    ${line}    WARN
     \    log    ${line}    ERROR

