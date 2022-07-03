*** Settings ***
Resource    ../Pages/LoginPage.robot
Resource    ../Pages/ProfilePage.robot

Test Setup      Open Session
Test Teardown   Close Session 

*** Test Cases ***
Alterar informações do perfil com sucesso
    [Tags]  profile   alteradoSucesso
    Acessar o site principal
    Logar com login e senha corretos
    Acessar a página My Profile
    Deve ser redirecionado para a tela My Profile
    Alterar informações da conta
    Deve ser redirecionado para página update successfully
    Deve ter o valor igual ao esperado