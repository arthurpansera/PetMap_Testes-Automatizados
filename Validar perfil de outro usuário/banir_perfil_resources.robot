*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost/PetMap/PROJETO/
${BOTAO_ENTRAR}    css=a.btn
${EMAIL_INPUT}     id=email
${PASSWORD_INPUT}  id=password
${BOTAO_LOGIN}     css=input.login-btn
${LOGIN_EMAIL_MOD}     moderador@petmap.com
${LOGIN_SENHA_MOD}     Moderador@123
${MENU_USUARIOS}    xpath=//a[contains(text(), 'Usuários Cadastrados')]
${BOTAO_VER_PERFIL}    css=a.btn-ver-perfil
${BOTAO_BANIR_USUARIO}    xpath=//button[@id='btnBanirUsuario']
${BOTAO_CONFIRMAR_BANIMENTO}    css=.swal2-confirm
${BADGE_BANIDO}    xpath=//img[@alt='Banido']
${ALERT_SUCESSO}    css=.swal2-popup
${BOTAO_DESBANIR}    xpath=//button[@id='btnDesbanirUsuario']

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Realizar login como moderador
    Click Element    ${BOTAO_ENTRAR}
    Wait Until Element Is Visible    ${EMAIL_INPUT}    timeout=10s
    Input Text    ${EMAIL_INPUT}    ${LOGIN_EMAIL_MOD}
    Input Text    ${PASSWORD_INPUT}    ${LOGIN_SENHA_MOD}
    Sleep    2s
    Capture Page Screenshot
    Click Element    ${BOTAO_LOGIN}

Acessar menu de usuários cadastrados
    Wait Until Element Is Visible    ${MENU_USUARIOS}    timeout=10s
    Click Element    ${MENU_USUARIOS}
    Sleep    2s
    Capture Page Screenshot

Selecionar primeiro usuário não banido
    Wait Until Element Is Visible    ${BOTAO_VER_PERFIL}    timeout=10s
    Sleep    1s
    Click Element    ${BOTAO_VER_PERFIL}
    Sleep    2s
    Capture Page Screenshot

Banir usuário
    Wait Until Element Is Visible    ${BOTAO_BANIR_USUARIO}    timeout=10s
    Sleep    1s
    Capture Page Screenshot
    Click Element    ${BOTAO_BANIR_USUARIO}

Confirmar banimento
    Wait Until Element Is Visible    ${BOTAO_CONFIRMAR_BANIMENTO}    timeout=10s
    Sleep    2s
    Capture Page Screenshot
    Click Element    ${BOTAO_CONFIRMAR_BANIMENTO}
    Sleep    2s

Verificar se usuário foi banido
    Wait Until Element Is Visible    ${ALERT_SUCESSO}    timeout=10s
    Sleep    2s
    Page Should Contain Element    ${BADGE_BANIDO}
    Page Should Contain Element    ${BOTAO_DESBANIR}
    Sleep    1s
    Capture Page Screenshot

Fechar o navegador
    Close Browser