*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost/PetMap/PROJETO/
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
${BOTAO_PUBLICAR}    css=button.create-post

${ALERTA_SUCESSO}    css=.swal2-html-container
${BOTAO_OK_SWEET}    css=button.swal2-confirm
${MENSAGEM_SUCESSO}    Publicação realizada com sucesso!

${TITULO_VALOR}    Cachorro perdido - Urgente
${CONTEUDO_VALOR}    Cachorro da raça Golden Retriever desapareceu na tarde de ontem. Pelo dourado, coleira azul. Atende por Thor.
${RUA_VALOR}    Rua XV de Novembro
${BAIRRO_VALOR}    Centro
${CIDADE_VALOR}    Curitiba

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

Usuário acessa a página principal
    Wait Until Element Is Visible    ${BOTAO_NOVA_PUBLICACAO}    timeout=10s
    Log To Console    Usuário está na página principal

Clicar no botão de realizar publicação no canto inferior direito
    Click Element    ${BOTAO_NOVA_PUBLICACAO}
    Sleep    2s

Preencher o formulário da publicação
    Wait Until Page Contains Element    ${INPUT_TITULO}    timeout=10s
    Input Text    ${INPUT_TITULO}    ${TITULO_VALOR}
    Input Text    ${INPUT_CONTEUDO}    ${CONTEUDO_VALOR}
    Select From List By Value    ${SELECT_TIPO}   animal
    Input Text    ${INPUT_RUA}    ${RUA_VALOR}
    Input Text    ${INPUT_BAIRRO}    ${BAIRRO_VALOR}
    Input Text    ${INPUT_CIDADE}    ${CIDADE_VALOR}
    Select From List By Value    ${SELECT_ESTADO}    PR

Clicar no botão Publicar
    Click Element    ${BOTAO_PUBLICAR}
    Sleep    2s

O sistema exibe o formulário de nova publicação
    Wait Until Page Contains Element    ${INPUT_TITULO}    timeout=10s
    Page Should Contain Element    ${INPUT_CONTEUDO}
    Page Should Contain Element    ${SELECT_TIPO}
    Log To Console    Formulário de publicação exibido com sucesso

O sistema aceita as informações inseridas
    Sleep    1s
    Log To Console    Sistema processando informações

O sistema registra a publicação
    Wait Until Element Is Visible    ${ALERTA_SUCESSO}    timeout=10s
    ${mensagem}=    Get Text    ${ALERTA_SUCESSO}
    Log To Console    Mensagem exibida: ${mensagem}
    Should Contain    ${mensagem}    ${MENSAGEM_SUCESSO}    ignore_case=True

Deve ser exibida uma mensagem de sucesso e o sistema deve manter o usuário na página principal
    Click Element    ${BOTAO_OK_SWEET}
    Wait Until Element Is Visible    ${BOTAO_NOVA_PUBLICACAO}    timeout=10s
    Log To Console    Usuário retornou para a página principal após publicação

Fechar o navegador
    Close Browser