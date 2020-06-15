# -*- coding: utf-8 -*-

*** Settings ***

Library    DateTime


*** Variables ***
&{ORDER_HEADER_IN}
#    MANDATORY
...  DOC_TYPE=TA
...  SALES_ORG=1234
...  DISTR_CHAN=01
...  DIVISION=01
...  PURCH_NO_C=TSET_ROBOT

&{PARTNERS}
#    MANDATORY
...  PARTN_NUMB=00599112222
...  PARTN_ROLE=AG

&{SCHEDULES}
...  REQ_QTY=1

@{ORDER_PARTNERS}      ${PARTNERS}
@{ORDER_SCHEDULES_IN}  ${SCHEDULES}


*** Test Cases ***
RF LOGGING EXAMPLES
    [Tags]  logging
    @{vars}=    Get Variables
    Log Many    @{vars}
    Log    Log level is ${LOG_LEVEL}

    Log  I've WARNED YOU, TSET!!!  WARN

    log         ${ORDER_PARTNERS}
    log         @{ORDER_PARTNERS}
    log many    ${ORDER_PARTNERS}
    log many    @{ORDER_PARTNERS}

    &{SCHEDULES}=  Create Dictionary
        ...  REQ_QTY=3
        ...  REQ_DATE=123456

    log         ${SCHEDULES}
    log many    ${SCHEDULES}
    log many    &{SCHEDULES}
    ${schedu}=  Evaluate  $SCHEDULES
    log         ${schedu}
    ${schedu}=  Evaluate  $SCHEDULES.REQ_DATE
    log         ${schedu}
    log         &{SCHEDULES}[REQ_DATE]


    ${date}=    Evaluate  datetime.date(2016,10,31)  modules=datetime
    log         ${date}
    ${SCHEDULES.REQ_DATE}=  Set Variable  ${date}
    ${SCHEDULES.REQ_DATE}=  Evaluate  datetime.date(2016,10,31)  modules=datetime
    log many    &{SCHEDULES}
    log many    @{ORDER_SCHEDULES_IN}

    @{ORDER_SCHEDULES_IN}    Create List    ${SCHEDULES}
    log many    @{ORDER_SCHEDULES_IN}

    ${year}  ${month}  ${day}  ${hour}  ${minute}=  Get Time  year,month,day,hour,min
    log      MUSCHEL${year}-${month}-${day}-${hour}-${minute}
    ${time}=  Set Variable  ${year}${month}${day}_${hour}${minute}
    ${ORDER_HEADER_IN.PURCH_NO_C}=  Set Variable  TSET_ROBOT_${time}
    log       &{ORDER_HEADER_IN}[PURCH_NO_C]

    ${rand_int}=  Evaluate  random.randint(0, 20)  random
    log           ${rand_int}
    