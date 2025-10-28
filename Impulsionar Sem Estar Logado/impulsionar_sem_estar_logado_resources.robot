*** Settings ***
Documentation     Recursos e keywords para testes de impulsionamento no PetMap
Library           SeleniumLibrary

*** Variables ***
${BROWSER}               Chrome
${URL_BASE}              http://localhost/PetMap/PROJETO/
${BOTAO_IMPULSIONAR}     css=button.like-button
${URL_LOGIN_CONTEM}      src/assets/pages/login.php
${INDICADOR_LOGIN}       css=input[id="email"]
${TEMPO_ESPERA}          10s

*** Keywords ***
Abrir Navegador
    Open Browser    ${URL_BASE}    ${BROWSER}
    Maximize Browser Window

Acessar Página Principal
    Go To    ${URL_BASE}
    Wait Until Page Contains Element    ${BOTAO_IMPULSIONAR}    timeout=${TEMPO_ESPERA}
    Capture PageScreenshot

Clicar no Botão Impulsionar
    Scroll Element Into View    ${BOTAO_IMPULSIONAR}
    Wait Until Element Is Visible    ${BOTAO_IMPULSIONAR}    timeout=${TEMPO_ESPERA}
    Click Element    ${BOTAO_IMPULSIONAR}
    Capture PageScreenshot

Verificar Redirecionamento Para Login
    Wait Until Location Contains    ${URL_LOGIN_CONTEM}    timeout=${TEMPO_ESPERA}
    Location Should Contain         ${URL_LOGIN_CONTEM}
    Wait Until Page Contains Element    ${INDICADOR_LOGIN}    timeout=${TEMPO_ESPERA}
    Page Should Contain Element     ${INDICADOR_LOGIN}
    Capture PageScreenshot

Fechar o Navegador
    Close Browser