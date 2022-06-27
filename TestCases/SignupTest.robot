*** Settings ***
Resource    ../Pages/SignupPage.robot
Resource    ../Pages/LoginPage.robot

Test Setup      Open Session
Test Teardown   Close Session 

*** Test Cases ***
Registro de usuário
    [Tags]      registro
    Acessar o site de Registro
    Registrar usuário com sucesso
    Deve ser redirecionado para a tela de login