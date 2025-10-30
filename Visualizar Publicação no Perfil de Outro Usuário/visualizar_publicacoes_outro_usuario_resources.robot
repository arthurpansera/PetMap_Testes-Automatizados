*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL_BASE}    http://localhost/PetMap/PROJETO/
${BARRA_PESQUISA}    css=form.search-bar input[name="pesquisa"]
${LISTA_SUGESTOES}    css=div.user-suggestions
${ITEM_SUGESTAO}    css=div.user-suggestions .suggestion-item:first-child
${AREA_PUBLICACOES}    css=.user-posts
${TEMPO_ESPERA}    10s

*** Keywords ***
Abrir Navegador
    Open Browser    ${URL_BASE}    ${BROWSER}
    Maximize Browser Window

Acessar Página Principal
    Go To    ${URL_BASE}
    Wait Until Page Contains Element    ${BARRA_PESQUISA}    timeout=${TEMPO_ESPERA}

Inserir Nome Na Barra De Pesquisa
    [Arguments]    ${nome_usuario}
    Wait Until Element Is Visible    ${BARRA_PESQUISA}    timeout=${TEMPO_ESPERA}
    Input Text    ${BARRA_PESQUISA}    ${nome_usuario}
    Capture PageScreenshot
    Sleep    2s
    Wait Until Element Is Visible    ${LISTA_SUGESTOES}    timeout=${TEMPO_ESPERA}

Selecionar Usuario Da Lista
    Wait Until Element Is Visible    ${ITEM_SUGESTAO}    timeout=${TEMPO_ESPERA}
    Click Element    ${ITEM_SUGESTAO}
    Wait Until Page Contains Element    ${AREA_PUBLICACOES}    timeout=${TEMPO_ESPERA}

Rolar Ate As Publicacoes
    Scroll Element Into View    ${AREA_PUBLICACOES}
    Capture PageScreenshot
    Sleep    1s

Verificar Exibicao Das Publicacoes
    Wait Until Element Is Visible    ${AREA_PUBLICACOES}    timeout=${TEMPO_ESPERA}
    Page Should Contain Element    ${AREA_PUBLICACOES}
    Capture PageScreenshot


Capturar Evidência
    [Arguments]    ${nome_arquivo}
    Capture Page Screenshot    ${nome_arquivo}

Fechar o Navegador
    Close Browser