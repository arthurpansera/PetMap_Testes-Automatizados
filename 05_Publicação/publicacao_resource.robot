*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem

*** Variables ***
${BROWSER}    Chrome
${URL_BASE}    http://localhost/PetMap/PROJETO/
${BOTAO_ENTRAR}    css=a.btn
${EMAIL_INPUT}    id=email
${PASSWORD_INPUT}    id=password
${BOTAO_LOGIN}    css=input.login-btn
${EMAIL_CONTA}    maria@gmail.com
${SENHA_CONTA}    maria@1234

${BOTAO_NOVA_PUBLICACAO}    css=button.floating-button
${INPUT_TITULO}    id=titulo
${INPUT_CONTEUDO}    id=conteudo
${SELECT_TIPO}    id=tipo_publicacao
${INPUT_RUA}    id=endereco_rua
${INPUT_BAIRRO}    id=endereco_bairro
${INPUT_CIDADE}    id=endereco_cidade
${SELECT_ESTADO}    id=state

${INPUT_TITULO_EDIT}    id=edit_titulo

${TITULO_VALOR}    Teste sem foto
${CONTEUDO_VALOR}    Publicação criada sem foto.
${RUA_VALOR}    Rua das Flores
${BAIRRO_VALOR}    Centro
${CIDADE_VALOR}    Curitiba

${MENSAGEM_SUCESSO_PUBLICACAO}    css=.swal2-html-container
${ICONE_SUCESSO}    css=.swal2-icon-success
${BOTAO_OK_SUCESSO}    css=.swal2-confirm

${BOTAO_PUBLICAR}    css=button.create-post
${BOTAO_SALVAR_ALTERACOES}  css=button[name='update_post']

${AREA_PERFIL}    css=a.profile-image
${PRIMEIRO_POST_XPATH}    xpath=//div[contains(@class,'user-posts')]/div[contains(@class,'post-item')][1]
${BOTAO_EDITAR}    css=button.edit-button
${BOTAO_EXCLUIR_DENTRO_DO_POST}    xpath=//div[contains(@class,'user-posts')]/div[contains(@class,'post-item')][1]//button[contains(@class,'delete-button')]
${BOTAO_CONFIRMAR_EXCLUSAO}     css=.swal2-confirm
${MENSAGEM_SUCESSO}    css=.swal-success-popup .swal2-html-container
${BOTAO_ENTENDIDO_SUCESSO}    css=.swal-success-popup .swal2-confirm

${TEMPO_ESPERA}    10s

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL_BASE}    ${BROWSER}
    Maximize Browser Window

Realizar login
    Wait Until Element Is Visible    ${BOTAO_ENTRAR}    timeout=${TEMPO_ESPERA} 
    Click Element    ${BOTAO_ENTRAR}
    Wait Until Element Is Visible    ${EMAIL_INPUT}    timeout=${TEMPO_ESPERA} 
    Input Text    ${EMAIL_INPUT}    ${EMAIL_CONTA}
    Input Text    ${PASSWORD_INPUT}    ${SENHA_CONTA}
    Capture Page Screenshot
    Click Element    ${BOTAO_LOGIN}

Acessar Pagina Principal
    Go To    ${URL_BASE}
    Wait Until Page Contains Element    ${BOTAO_NOVA_PUBLICACAO}    timeout=${TEMPO_ESPERA}

Acessar Pagina De Perfil
    Go To    ${URL_BASE}
    Wait Until Page Contains Element    ${AREA_PERFIL}    timeout=${TEMPO_ESPERA}
    Click Element    ${AREA_PERFIL}
    Capture Page Screenshot

Clicar No Botao Excluir De Alguma Publicacao
    Wait Until Element Is Visible    ${PRIMEIRO_POST_XPATH}    timeout=20s
    Scroll Element Into View        ${PRIMEIRO_POST_XPATH}
    Click Element                   ${BOTAO_EXCLUIR_DENTRO_DO_POST}
    Capture Page Screenshot


Clicar No Botao Sim Excluir
    Wait Until Element Is Visible    ${BOTAO_CONFIRMAR_EXCLUSAO}    timeout=${TEMPO_ESPERA} 
    Click Element                   ${BOTAO_CONFIRMAR_EXCLUSAO}
    Capture Page Screenshot

Verificar Exclusao Da Publicacao
    Wait Until Element Is Visible    css=.swal2-popup    timeout=15s
    Element Should Contain          css=.swal2-html-container    Aguarde um momento.
    Capture Page Screenshot
    Sleep    3s
    Wait Until Page Contains Element    css=.swal2-popup    timeout=15s
    Wait Until Page Contains Element    css=.swal2-success    timeout=${TEMPO_ESPERA} 
    Wait Until Page Contains Element    css=.swal2-icon-success    timeout=${TEMPO_ESPERA} 
    Capture Page Screenshot
    Wait Until Element Is Visible    css=.swal2-confirm    timeout=5s
    Click Element    css=.swal2-confirm
    Wait Until Page Does Not Contain Element    css=.swal2-popup    timeout=5s
    Capture Page Screenshot
    Sleep    1s

Preencher o formulário da publicação sem inserir foto
    Wait Until Element Is Visible    ${INPUT_TITULO}    timeout=${TEMPO_ESPERA}
    Input Text    ${INPUT_TITULO}    ${TITULO_VALOR}
    Input Text    ${INPUT_CONTEUDO}    ${CONTEUDO_VALOR}
    Select From List By Value    ${SELECT_TIPO}    animal
    Input Text    ${INPUT_RUA}    ${RUA_VALOR}
    Input Text    ${INPUT_BAIRRO}    ${BAIRRO_VALOR}
    Input Text    ${INPUT_CIDADE}    ${CIDADE_VALOR}
    Select From List By Value    ${SELECT_ESTADO}    PR
    Capture Page Screenshot

Clicar No Botao Publicar Para Envio
    Click Element    ${BOTAO_PUBLICAR}
    Sleep    2s
    Capture Page Screenshot

Verificar Que Sistema Registrou Publicacao
    Wait Until Element Is Visible    ${ICONE_SUCESSO}    timeout=${TEMPO_ESPERA}
    Element Should Contain    ${MENSAGEM_SUCESSO_PUBLICACAO}    realizada com sucesso
    Capture Page Screenshot
    Click Element    ${BOTAO_OK_SUCESSO}
    Sleep    1s
    ${url_atual}=    Get Location
    Should Contain    ${url_atual}    PROJETO
    Capture Page Screenshot

Clicar No Botao Editar De Alguma Publicacao
    Wait Until Element Is Visible    ${PRIMEIRO_POST_XPATH}    timeout=${TEMPO_ESPERA}
    Scroll Element Into View    ${PRIMEIRO_POST_XPATH}
    Click Element    ${BOTAO_EDITAR}
    Wait Until Element Is Visible    ${INPUT_TITULO_EDIT}    timeout=${TEMPO_ESPERA}
    Capture Page Screenshot

Editar O Titulo Da Publicacao
    [Arguments]    ${novo_titulo}
    Wait Until Element Is Visible    ${INPUT_TITULO_EDIT}    timeout=${TEMPO_ESPERA}
    Clear Element Text    ${INPUT_TITULO_EDIT}
    Input Text    ${INPUT_TITULO_EDIT}    ${novo_titulo}
    Capture Page Screenshot

Clicar No Botao Salvar Alteracoes
    Wait Until Element Is Visible    ${BOTAO_SALVAR_ALTERACOES}    timeout=${TEMPO_ESPERA}
    Scroll Element Into View    ${BOTAO_SALVAR_ALTERACOES}
    Sleep    1s
    Wait Until Element Is Enabled    ${BOTAO_SALVAR_ALTERACOES}    timeout=5s
    Click Element    ${BOTAO_SALVAR_ALTERACOES}
    Sleep    2s
    Capture Page Screenshot

Verificar Edicao Do Titulo Com Sucesso
    [Arguments]    ${titulo_esperado}
    Wait Until Element Is Visible    ${ICONE_SUCESSO}    timeout=${TEMPO_ESPERA}
    Element Should Contain    ${MENSAGEM_SUCESSO_PUBLICACAO}    sucesso
    Capture Page Screenshot
    Click Element    ${BOTAO_OK_SUCESSO}
    Sleep    1s
    Wait Until Element Is Visible    ${PRIMEIRO_POST_XPATH}    timeout=${TEMPO_ESPERA}
    Element Should Contain    ${PRIMEIRO_POST_XPATH}    ${titulo_esperado}
    Capture Page Screenshot

Fechar o navegador
    Close Browser
