*** Settings ***
Resource    ../Pages/LoginPage.robot

Test Setup      Open Session
Test Teardown   Close Session 

*** Test Cases ***
Realizar login com sucesso
    [Tags]  login   loginSucesso
    Acessar o site principal
    Logar com login e senha corretos
    Deve ser redirecionado para a tela de usuário

Realizar login com email inexistente
    [Tags]  login   loginFalha
    Acessar o site principal
    Logar com email inexistente
    Deve ser redirecionado para a tela de login com falha




