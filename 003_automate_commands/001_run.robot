#  Robot Framework

*** Settings ***

Library    OperatingSystem	
Library    Process		
#Library    String	



*** Test Cases ***

Run Process
    ${result}=    Run Process    python    -c    print 'Hello, world!'
    Should Be Equal    ${result.stdout}   Hello, world!

Run Command ls -lhF
    ${output}=    Run    ls -lhF /tmp
    Log    ${output}

Run Command ls -la
    ${output}=    Run    ls /tmp 2>&1
    Log    ${output}

Run Command ls
    ${output}=    Run    ls /tmp 2>${CURDIR}/standerr.txt
    Log    ${output}