*** Settings ***
Library    Browser
Library    DateTime
Library    String
Library    OperatingSystem

# !!! ============================ | Keywords | ============================ !!!
Resource    ../resources/keywords/common.robot
Resource    ../resources/keywords/botegs_cm.Create.robot
Resource    ../resources/keywords/botegs_cm_Edit.robot
Resource    ../resources/keywords/botegs_cm.View.robot
Resource    ../resources/keywords/botegs_cm.Cancel.robot

# !!! ============================ | Variables | ============================ !!!
# element selector
Resource    ../resources/variables/element_selector/selector_botegs_cm.robot
Resource    ../resources/variables/element_selector/common.robot
# test data
Resource    ../resources/variables/test_data/testdata_botegs_cm.robot
