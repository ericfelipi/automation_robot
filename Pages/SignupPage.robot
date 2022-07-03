*** Settings ***
Resource    ../Infra/base.robot
Library     ../Infra/Library/Signup.py

*** Variables ***
${txt_first_name}       xpath://input[@placeholder="First Name"]
${txt_last_name}        xpath://input[@placeholder="Last Name"]
${txt_phone}            xpath://input[@placeholder="Phone"]
${txt_email}            xpath://input[@placeholder="Email"]
${txt_password}         xpath://input[@placeholder="Password"]
${account_type}         xpath://span[@class="selection"]/span
${btn_signup}           xpath://button[@type="submit"]

*** Keywords ***
#Funções
Escrever nome           
    [Arguments]         ${first_name}          
    Input Text          ${txt_first_name}   ${first_name}      

Escrever sobrenome      
    [Arguments]         ${last_name}
    Input Text          ${txt_last_name}    ${last_name}    

Escrever telefone       
    [Arguments]         ${phone}
    Input Text          ${txt_phone}        ${phone}

Escrever email          
    [Arguments]         ${email}
    Input Text          ${txt_email}        ${email}

Escrever senha registro         
    [Arguments]         ${password}
    Input text          ${txt_password}     ${password}

Selecionar Tipo
    [Arguments]         ${type}
    Click Element       ${account_type}
    ${account_types}=   Get WebElement      xpath://li[text()="Agent"]
    Click Element       ${account_types}

Clicar botão registrar
    Click button        ${btn_signup} 

#Funcionalidade
Registrar usuário
    [Arguments]     ${phone}    ${password}

    ${nome_sorteado}=       Sortear Nome
    ${sobrenome_sorteado}=  Sortear Sobrenome
    ${email_sorteado}=      Sortear Email

    Escrever nome               ${nome_sorteado}
    Escrever sobrenome          ${sobrenome_sorteado}
    Escrever telefone           ${phone}
    Escrever email              ${email_sorteado}
    Escrever senha registro     ${password}
    Selecionar Tipo             Agent
    Clicar botão registrar

#Passos
Acessar o site de Registro
    Ir Para     signup

Registrar usuário com sucesso
    Registrar usuário   48988554466     123pass
    
Deve ser redirecionado para a tela de login
    Verificar label regitro com sucesso
