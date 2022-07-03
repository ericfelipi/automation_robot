*** Settings ***
Resource    ../Infra/base.robot
Resource    ../Pages/LoginPage.robot

*** Variables ***

${txt_from}         xpath://input[@id="autocomplete"]
${txt_to}           xpath://input[@id="autocomplete2"]
${btn_search}       xpath://button[@id="flights-search"]
${lbl_flights}      xpath://a[contains(text(),"Total Flights")]

*** Keywords ***
#Funções
Verificar página de voos
    Location Should Be      https://www.phptravels.net/flights

Escrever origem
    [Arguments]         ${flying_from}
    Input Text          ${txt_from}         ${flying_from}

Selecionar origem
    [Arguments]         ${from}
    ${select_from}      Get WebElement  xpath://b[text()="GRU"]
    Click Element       ${select_from}

Escrever destino
    [Arguments]         ${to_dest}
    Input Text          ${txt_to}           ${to_dest}

Selecionar destino
    [Arguments]         ${to}
    ${select_to}        Get WebElement  xpath://b[text()="JPA"]
    Click Element       ${select_to}

Clicar botão procurar
    Click button        ${btn_search}

Verificar label passagens
    Wait Until Element Contains    ${lbl_flights}   Total Flight  

#Funcionalidades
Realizar busca de passagem
    [Arguments]         ${from}         ${to}
    Escrever origem     ${from} 
    Selecionar origem   GRU
    Escrever destino    ${to}
    Selecionar destino  JPA

#Passos
Acessar página de voos
    Ir Para     flights

Deve ser direcionado para página de voos
    Verificar página de voos

Buscar destinos    
    Realizar busca de passagem     GRU    JPA

Clicar botão buscar
    Clicar botão procurar

Deve ser direcionado para página de passagens
    Verificar label passagens