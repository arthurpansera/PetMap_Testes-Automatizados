*** Settings ***
Documentation     Recursos e keywords para testes de impulsionamento no PetMap
Library           SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL_BASE}    http://localhost/PetMap/PROJETO/
${BOTAO_ENTRAR}    css=a.btn
${EMAIL_INPUT}    id=email
${PASSWORD_INPUT}    id=password
${BOTAO_LOGIN}    css=input.login-btn
${EMAIL_CONTA}    maria@gmail.com
${SENHA_CONTA}    maria@1234

${BOTAO_IMPULSIONAR}        css=button.like-button
${TEMPO_ESPERA}             10s

*** Keywords ***
Abrir Navegador
    Open Browser    ${URL_BASE}    ${BROWSER}
    Maximize Browser Window

Fazer Login
    Go To    ${URL_BASE}
    Wait Until Element Is Visible    ${BOTAO_ENTRAR}    timeout=${TEMPO_ESPERA}
    Click Element    ${BOTAO_ENTRAR}
    Wait Until Element Is Visible    ${EMAIL_INPUT}    timeout=${TEMPO_ESPERA}
    Input Text    ${EMAIL_INPUT}    ${EMAIL_CONTA}
    Input Text    ${PASSWORD_INPUT}    ${SENHA_CONTA}
    Capture PageScreenshot
    Click Element    ${BOTAO_LOGIN}
    
Acessar Página Principal
    Go To    ${URL_BASE}
    Wait Until Page Contains Element    ${BOTAO_IMPULSIONAR}    timeout=${TEMPO_ESPERA}
    Capture PageScreenshot

Clicar no Botão Impulsionar
    Scroll Element Into View    ${BOTAO_IMPULSIONAR}
    Wait Until Element Is Visible    ${BOTAO_IMPULSIONAR}    timeout=${TEMPO_ESPERA}
    Click Element    ${BOTAO_IMPULSIONAR}
    Capture PageScreenshot

Verificar Remocao Do Impulso
    Wait Until Element Is Visible    ${BOTAO_IMPULSIONAR}    timeout=${TEMPO_ESPERA}
    ${classe_atual}=    Get Element Attribute    ${BOTAO_IMPULSIONAR}    class
    Should Not Contain    ${classe_atual}    impulsionado
    Capture PageScreenshot

Fechar o Navegador
    Close Browser