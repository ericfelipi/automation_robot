*** Settings ***
Resource    ../Infra/base.robot

*** Variables ***
${lbl_account}      xpath://h2[contains(text(),"Hi")]

*** Keywords ***
Verificar label Account
    Wait Until Page Contains Element    ${lbl_account}

