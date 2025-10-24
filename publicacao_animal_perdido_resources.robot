*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost/PetMap/PROJETO/
${BOTAO_ENTRAR}    css=a.btn
${EMAIL_INPUT}    id=email
${PASSWORD_INPUT}    id=password
${BOTAO_LOGIN}    css=input.login-btn
${EMAIL_CONTA}    joao@gmail.com
${SENHA_CONTA}    Cid@1234

${BOTAO_NOVA_PUBLICACAO}    css=button.floating-button
${INPUT_TITULO}    id=titulo
${INPUT_CONTEUDO}    id=conteudo
${SELECT_TIPO}    id=tipo_publicacao
${INPUT_RUA}    id=endereco_rua
${INPUT_BAIRRO}    id=endereco_bairro
${INPUT_CIDADE}    id=endereco_cidade
${SELECT_ESTADO}    id=state
${BOTAO_PUBLICAR}    css=button.create-post

${CT7_TITULO_VALOR}    Cachorro perdido na praça
${CT7_CONTEUDO_VALOR}    Meu cachorro desapareceu ontem na praça central.
${CT7_RUA_VALOR}    Rua das Flores
${CT7_BAIRRO_VALOR}    Centro
${CT7_CIDADE_VALOR}    Curitiba

${BOTAO_OK_AVISO}    css=button.swal2-confirm

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Realizar login
    Wait Until Element Is Visible    ${BOTAO_ENTRAR}
    Click Element    ${BOTAO_ENTRAR}
    Wait Until Element Is Visible    ${EMAIL_INPUT}    timeout=10s
    Input Text    ${EMAIL_INPUT}    ${EMAIL_CONTA}
    Input Text    ${PASSWORD_INPUT}    ${SENHA_CONTA}
    Click Element    ${BOTAO_LOGIN}

Acessar página principal
    Sleep    2s
    Capture PageScreenshot

Clicar no botão de realizar publicação no canto inferior direito
    Wait Until Element Is Visible    ${BOTAO_NOVA_PUBLICACAO}    timeout=10s
    Click Element    ${BOTAO_NOVA_PUBLICACAO}
    Sleep    2s
    Capture PageScreenshot

Preencher o formulário da publicação
    Wait Until Page Contains Element    ${INPUT_TITULO}    timeout=10s
    Input Text    ${INPUT_TITULO}    ${CT7_TITULO_VALOR}
    Input Text    ${INPUT_CONTEUDO}    ${CT7_CONTEUDO_VALOR}
    Select From List By Value    ${SELECT_TIPO}    animal
    Input Text    ${INPUT_RUA}    ${CT7_RUA_VALOR}
    Input Text    ${INPUT_BAIRRO}    ${CT7_BAIRRO_VALOR}
    Input Text    ${INPUT_CIDADE}    ${CT7_CIDADE_VALOR}
    Select From List By Value    ${SELECT_ESTADO}    PR
    Sleep    2s
    Capture PageScreenshot

Clicar no botão "Publicar"
    Click Element    ${BOTAO_PUBLICAR}
    Sleep    2s
    Capture PageScreenshot

Verificar se a publicação foi registrada com sucesso
    Wait Until Element Is Visible    ${BOTAO_OK_AVISO}    timeout=10s
    Click Element    ${BOTAO_OK_AVISO}
    Sleep    2s
    Capture PageScreenshot

Fechar o navegador
    Close Browser