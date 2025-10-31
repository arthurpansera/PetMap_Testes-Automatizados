*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost/PetMap/PROJETO/
${BOTAO_ENTRAR}    css=a.btn
${LINK_ANIMAIS_PERDIDOS}    link=Animais Perdidos
${MENSAGEM_SEM_PUBLICACOES}    Não há publicações disponíveis

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar página principal
    Wait Until Page Contains Element    ${BOTAO_ENTRAR}    timeout=10s
    Sleep    2s
    Capture Page Screenshot

Acessar página "Animais Perdidos"
    Wait Until Page Contains Element    ${LINK_ANIMAIS_PERDIDOS}    timeout=10s
    Click Link    ${LINK_ANIMAIS_PERDIDOS}

Verificar mensagem "Não há publicações disponíveis"
    Wait Until Page Contains    ${MENSAGEM_SEM_PUBLICACOES}    timeout=10s
    Capture Page Screenshot