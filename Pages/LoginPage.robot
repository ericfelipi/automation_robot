*** Settings ***
Resource    ../Infra/base.robot
Resource    ./AccountPage.robot

*** Variables ***
${txt_username}     xpath://input[@placeholder="Email"]
${txt_password}     xpath://input[@placeholder="Password"]
${btn_login}        xpath://button[./span[text()="Login"]]

*** Keywords ***
#Funções
Escrever login
    [Arguments]     ${username}
    Input Text      ${txt_username}     ${username}

Escrever senha
    [Arguments]     ${password}
    Input Text      ${txt_password}     ${password}

Clicar botão login
    Click button    ${btn_login}

Verificar label regitro com sucesso
    Location Should Be    https://www.phptravels.net/login/signup
    
#Funcionalidade
Realize login   
    [Arguments]         ${username}         ${password}   

    Escrever login      ${username}
    Escrever senha      ${password}
    Clicar botão login   

#Passos
Acessar o site principal
    Log to console      Acessou a tela principal  
    Ir Para     login

Logar com login e senha corretos
    Realize login       user@phptravels.com    demouser

Deve ser redirecionado para a tela de usuário  
    Verificar label Account
    

    