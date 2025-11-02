*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost/PetMap/PROJETO/
${BOTAO_ENTRAR}    css=a.btn
${EMAIL_INPUT}     id=email
${PASSWORD_INPUT}  id=password
${BOTAO_LOGIN}     css=input.login-btn
${LOGIN_EMAIL_MOD}     modteste@gmail.com
${LOGIN_SENHA_MOD}     Mod@1234
${MENU_USUARIOS}    xpath=//a[contains(text(), 'Usuários Cadastrados')]
${BOTAO_VER_PERFIL}    css=a.btn-ver-perfil
${TAB_PUBLICACOES}    xpath=//button[contains(text(), 'Publicações')]
${BOTAO_REMOVER_PUBLICACAO}    css=.delete-post-button.sweet-remove-btn
${BOTAO_CONFIRMAR_REMOCAO}    css=.swal2-confirm
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

Remover primeira publicação
    Wait Until Element Is Visible    ${BOTAO_REMOVER_PUBLICACAO}    timeout=10s
    Sleep    1s
    Capture Page Screenshot
    Click Element    ${BOTAO_REMOVER_PUBLICACAO}

Confirmar remoção da publicação
    Wait Until Element Is Visible    ${BOTAO_CONFIRMAR_REMOCAO}    timeout=10s
    Sleep    2s
    Capture Page Screenshot
    Click Element    ${BOTAO_CONFIRMAR_REMOCAO}
    Sleep    2s

Verificar se publicação foi removida
    Page Should Contain    Publicação removida com sucesso
    Sleep    1s
    Capture Page Screenshot

Fechar o navegador
    Close Browser