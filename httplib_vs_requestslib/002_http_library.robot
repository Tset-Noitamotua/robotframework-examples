*** Settings ***
| Library | HttpLibrary.HTTP
 
*** Test Cases ***
001 headers (extern)
| | [Documentation] | GET http://httpbin.org/headers
| | [Tags]          | extern
| | Create Http Context  | httpbin.org
| | ${response}=    | GET | /headers
| | log | ${response}
| | log | ${response.raw}
| | log | ${response.text}
| | log | ${response.content}
| | log | ${response.encoding}
| | log | ${response.json()}
| | log | @{response.json()}
| | log | @{response.json()}[0]
| | log | &{response.json()}[headers]
| | &{headers}= | Set Variable | &{response.json()}[headers]
| | log | &{headers}[Host]
| | log | @{headers}[0]
| | log | @{headers}[1]
| | Should Contain  | ${response.text} | User-Agent
| | Should Contain  | &{response.json()}[headers] | Host
| | Should Be Equal | &{headers}[Host] | httpbin.org
| | Should Be Equal As Strings | &{headers}[Host] | httpbin.org
