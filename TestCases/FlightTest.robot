*** Settings ***
Resource    ../Pages/FlightsPage.robot
Resource    ../Pages/LoginPage.robot

Test Setup      Open Session
Test Teardown   Close Session 

*** Test Cases ***
Buscar passagem com sucesso
    [Tags]      busca   passagem      
    Acessar o site principal
    Logar com login e senha corretos
    Acessar página de voos
    Verificar página de voos
    Buscar destinos
    Clicar botão buscar
    Deve ser direcionado para página de passagens