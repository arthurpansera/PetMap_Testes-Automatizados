*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost/PetMap/PROJETO/
${BOTAO_ENTRAR}    css=a.btn
${EMAIL_INPUT}     id=email
${PASSWORD_INPUT}  id=password
${BOTAO_LOGIN}     css=input.login-btn
${LOGIN_EMAIL}     modteste@gmail.com
${LOGIN_SENHA}     Mod@1234
${BOTAO_PERFIL}    css=a.profile-image
${BOTAO_EXCLUIR_CONTA}    css=button.profile-delete
${BOTAO_CONFIRMAR_EXCLUSAO}    css=.swal2-confirm

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Realizar login como moderador
    Click Element    ${BOTAO_ENTRAR}
    Wait Until Element Is Visible    ${EMAIL_INPUT}    timeout=10s
    Input Text    ${EMAIL_INPUT}    ${LOGIN_EMAIL}
    Input Text    ${PASSWORD_INPUT}    ${LOGIN_SENHA}
    Click Element    ${BOTAO_LOGIN}

Acessar página de perfil
    Wait Until Element Is Visible    ${BOTAO_PERFIL}    timeout=10s
    Click Element    ${BOTAO_PERFIL}

Clicar no botão "Excluir Conta"
    Wait Until Element Is Visible    ${BOTAO_EXCLUIR_CONTA}    timeout=10s
    Click Element    ${BOTAO_EXCLUIR_CONTA}

Clicar no botão de confirmação "Sim, excluir"
    Wait Until Element Is Visible    ${BOTAO_CONFIRMAR_EXCLUSAO}    timeout=10s
    Sleep    2s
    Capture PageScreenshot
    Sleep    2s
    Click Element    ${BOTAO_CONFIRMAR_EXCLUSAO}

Fechar o navegador
    Sleep    1s
    Capture PageScreenshot
    Close Browser