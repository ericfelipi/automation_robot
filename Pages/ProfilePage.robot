*** Settings ***
Resource    ../Infra/base.robot
Resource    ./AccountPage.robot

*** Variables ***
${txt_firstname}     xpath://input[@name="firstname"]
${txt_lastname}      xpath://input[@name="lastname"]
${txt_phone}         xpath://input[@name="phone"]
${txt_email}         xpath://input[@name="email"]
${btn_cookies}       xpath://button[@id="cookie_stop"]
${btn_update}        xpath://button[@type="submit"]
${lbl_update}        xpath://div[@class="alert alert-success"]

*** Keywords ***
#Funções
Verificar página My Profile
    Location Should Be      https://www.phptravels.net/account/profile  

Editar First Name
    [Arguments]     ${first_name}
    Input Text      ${txt_firstname}     ${first_name}

Editar Last Name
    [Arguments]     ${last_name}    
    Input Text      ${txt_lastname}     ${last_name} 

Editar Phone
    [Arguments]     ${phone}    
    Input Text      ${txt_phone}        ${phone}

Clicar botão aceitar cookies
    Click Button    ${btn_cookies}

Clicar botão update
    Wait Until Element Is Visible   ${btn_update}
    Submit Form     

Verificar label profile update
    Wait Until Page Contains Element        ${lbl_update}

Verificar se o valor é igual ao esperado
    ${value}=   Get value   xpath://input[@name="firstname"]
    Should Be Equal      ${value}    NovoNome
    
#Funcionalidade
Realizar alterações no profile 
    Editar First Name  NovoNome
    Editar Last Name   NovoSobrenome
    Editar Phone       19975845485
    Clicar botão aceitar cookies
    Clicar botão update
    Verificar se o valor é igual ao esperado

#Passos
Acessar a página My Profile
    Ir Para     account/profile

Deve ser redirecionado para a tela My Profile  
    Verificar página My Profile

Alterar informações da conta
    Realizar alterações no profile 

Deve ser redirecionado para página update successfully
    Verificar label profile update

Deve ter o valor igual ao esperado
    Verificar se o valor é igual ao esperado

    