*** Settings ***
| Library | RequestsLibrary
#| Library | Collections
 
*** Test Cases ***
001 GET (extern)
| | [Documentation] | GET http://httpbin.org/headers
| | [Tags]          | extern
| | Create Session  | httpbin | http://httpbin.org
| | ${response}=    | Get Request | httpbin | /headers
| | log | ${response}
| | log | ${response.raw}
| | log | ${response.text}
| | log | ${response.content}
| | log | ${response.encoding}
| | log | ${response.status_code}
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

002 POST (extern)
| | [Documentation] | https://www.hurl.it/
| | ...             | POST https://yourapihere.com/
| | [Tags]          | yourapihere
| | &{headers}=     | Create Dictionary | name=tset_noitamotua | WHO_AM_I=ROBOT
| | &{data}=        | Create Dictionary | mydata=foo | yourdata=bar
| | &{params}=      | Create Dictionary | myparams=yourparams
| | &{args}=        | Create Dictionary | myargs=yourargs
| | Create Session  | yourapihere | https://yourapihere.com/
| | ${response}=    | Post Request | yourapihere | / | headers=${headers}
| |  ...            | data=${data}
| |  ...            | params=${params}
| | log | ${response}
| | log | ${response.raw}
| | log | ${response.text}
| | log | ${response.content}
| | log | ${response.encoding}
| | log | ${response.status_code}
| | log | ${response.json()}
| | log many | @{response.json()}
| | log many | @{response.json()}[0]
| | log | &{response.json()}[headers]
| | &{headers}= | Set Variable | &{response.json()}[headers]
| | log | &{headers}[Host]
| | log | @{headers}[0]
| | log | @{headers}[1]
| | Should Contain  | ${response.text} | User-Agent
| | Should Contain  | &{response.json()}[headers] | Host
| | Should Be Equal | &{headers}[Host] | yourapihere.com
| | Should Contain  | &{response.json()}[headers] | Who-Am-I
| | Should Be Equal | &{headers}[Who-Am-I] | ROBOT

003 PUT (extern)
| | [Documentation] | https://www.hurl.it/
| | ...             | PUT https://yourapihere.com/
| | [Tags]          | yourapihere
| | &{headers}=     | Create Dictionary | name=tset_noitamotua | WHO_AM_I=ROBOT
| | &{data}=        | Create Dictionary | mydata=foo | yourdata=bar
| | &{params}=      | Create Dictionary | myparams=yourparams
| | &{args}=        | Create Dictionary | myargs=yourargs
| | Create Session  | yourapihere | https://yourapihere.com/
| | ${response}=    | Put Request | yourapihere | / | headers=${headers}
| |  ...            | data=${data}
| |  ...            | params=${params}
| | log | ${response}
| | log | ${response.raw}
| | log | ${response.text}
| | log | ${response.content}
| | log | ${response.encoding}
| | log | ${response.status_code}
| | log | ${response.json()}
| | log many | @{response.json()}
| | log many | @{response.json()}[0]
| | log | &{response.json()}[headers]
| | &{headers}= | Set Variable | &{response.json()}[headers]
| | log | &{headers}[Host]
| | log | @{headers}[0]
| | log | @{headers}[1]
| | Should Contain  | ${response.text} | User-Agent
| | Should Contain  | &{response.json()}[headers] | Host
| | Should Be Equal | &{headers}[Host] | yourapihere.com
| | Should Contain  | &{response.json()}[headers] | Who-Am-I
| | Should Be Equal | &{headers}[Who-Am-I] | ROBOT

003 check host value (extern)
| | [Documentation] | GET http://httpbin.org/headers
| | ...             | Check value of  'Host'
| | ...             | Expected: 'Host'=='httpbin.org'
| | [Tags]          | extern
| | Create Session  | httpbin | http://httpbin.org
| | ${response}=    | Get Request | httpbin | /headers
| | &{headers}= | Set Variable | &{response.json()}[headers]
| | log | &{headers}[Host]
| | Should Be Equal | &{headers}[Host] | httpbin.org
