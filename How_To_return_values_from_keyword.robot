# Returning variables from keyword
#
# run this with `robot -L TRACE How_To_return_values_from_keyword.robot


*** Test Cases ***
001 give me all animals
  [Documentation]  Unpack returned values of "all animals" keyword
    ...            into ${animals} variable.
    ...
  ${animals}=  all animals
  Log To Console    \n\nAll Animals:
  Log  ${animals}\n  console=True

002 give me dogs only
  [Documentation]  Unpack only first value of "all animals" keyword
    ...            into ${dogs} variable.
    ...
  ${dogs}  ${_}  ${_}  ${_}  all animals
  # ${dogs}  ${_}  ${_}  ${_}=  all animals  # more obvious
  Log To Console  \n\nMy Lovely Dogs:
  Log  ${dogs}\n  console=True



*** Keywords ***
all animals
  [Documentation]  Returns a list with all animals.
  ...
  @{dog_list}=     Set Variable  puppy  chuppy  choopy
  @{animal_list}=  Set Variable  ${dog_list}  cats  pigs  cows
  #Log To Console    \n\nAnimals:
  #Log  ${animal_list}\n  console=True
  #Log To Console    \List of Dogs:
  #Log  ${dog_list}\n  console=True
  Return From Keyword  ${animal_list}
