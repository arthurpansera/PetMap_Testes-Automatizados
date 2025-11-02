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
${TAB_PUBLICACOES}    xpath=//button[contains(text(), 'Publicações')]
${BOTAO_VALIDAR_PUBLICACAO}    xpath=//button[@name='validar_publicacao']
${BOTAO_CONFIRMAR_VALIDACAO}    css=.swal2-confirm
${BADGE_PUBLICACAO_VERIFICADA}    xpath=//button[contains(@class, 'verified-post-button')]
${LABEL_PUBLICACAO_VERIFICADA}    xpath=//span[contains(@class, 'verified-label')]
${ALERT_SUCESSO}    css=.swal2-popup

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

Selecionar usuário com publicações
    Wait Until Element Is Visible    ${BOTAO_VER_PERFIL}    timeout=10s
    Sleep    1s
    Click Element    ${BOTAO_VER_PERFIL}
    Sleep    2s
    Capture Page Screenshot

Acessar aba de publicações
    Wait Until Element Is Visible    ${TAB_PUBLICACOES}    timeout=10s
    Sleep    1s
    Click Element    ${TAB_PUBLICACOES}
    Sleep    2s
    Capture Page Screenshot

Validar primeira publicação não verificada
    Wait Until Element Is Visible    ${BOTAO_VALIDAR_PUBLICACAO}    timeout=10s
    Sleep    1s
    Capture Page Screenshot
    Click Element    ${BOTAO_VALIDAR_PUBLICACAO}

Confirmar validação da publicação
    Wait Until Element Is Visible    ${BOTAO_CONFIRMAR_VALIDACAO}    timeout=10s
    Sleep    2s
    Capture Page Screenshot
    Click Element    ${BOTAO_CONFIRMAR_VALIDACAO}
    Sleep    2s

Verificar se publicação foi validada
    Wait Until Element Is Visible    ${ALERT_SUCESSO}    timeout=10s
    Sleep    1s
    Capture Page Screenshot
    Sleep    2s
    Page Should Contain Element    ${BADGE_PUBLICACAO_VERIFICADA}
    Page Should Contain Element    ${LABEL_PUBLICACAO_VERIFICADA}
    Sleep    1s
    Capture Page Screenshot

Fechar o navegador
    Close Browser