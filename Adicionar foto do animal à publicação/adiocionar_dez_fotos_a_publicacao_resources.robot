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

${INPUT_FOTOS}    id=foto_publicacao
${ALERTA_SWEET}    css=.swal2-html-container
${BOTAO_OK_SWEET}  css=button.swal2-confirm
${MENSAGEM_ESPERADA}    Você pode selecionar no máximo 8 imagens.

${TITULO_VALOR}    Gato para adoção
${CONTEUDO_VALOR}    Gatinho encontrado precisando de um lar.
${RUA_VALOR}    Avenida das Américas
${BAIRRO_VALOR}    Batel
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
    Capture Page Screenshot

Clicar no botão de realizar publicação
    Wait Until Element Is Visible    ${BOTAO_NOVA_PUBLICACAO}    timeout=10s
    Click Element    ${BOTAO_NOVA_PUBLICACAO}
    Sleep    2s
    Capture Page Screenshot

Preencher o formulário da publicação CT14
    Wait Until Page Contains Element    ${INPUT_TITULO}    timeout=10s
    Input Text    ${INPUT_TITULO}    ${TITULO_VALOR}
    Input Text    ${INPUT_CONTEUDO}    ${CONTEUDO_VALOR}
    Select From List By Value    ${SELECT_TIPO}    animal
    Input Text    ${INPUT_RUA}    ${RUA_VALOR}
    Input Text    ${INPUT_BAIRRO}    ${BAIRRO_VALOR}
    Input Text    ${INPUT_CIDADE}    ${CIDADE_VALOR}
    Select From List By Value    ${SELECT_ESTADO}    PR
    Capture Page Screenshot

Adicionar 10 fotos à publicação
    [Documentation]    Tenta adicionar 10 fotos para validar o limite de 8
    ${imagens}=    List Files In Directory    ${EXECDIR}/Adicionar foto do animal à publicação/Arquivos/imagens/    absolute=True
    ${contador}=    Set Variable    0
    
    FOR    ${foto}    IN    @{imagens}
        Exit For Loop If    ${contador} >= 10
        Choose File    ${INPUT_FOTOS}    ${foto}
        Sleep    0.5s
        ${contador}=    Evaluate    ${contador} + 1
    END
    Capture Page Screenshot

Verificar se o limite de fotos foi respeitado
    [Documentation]    Verifica se o SweetAlert foi exibido e contém o texto correto
    Wait Until Element Is Visible    ${ALERTA_SWEET}    timeout=5s
    ${mensagem}=    Get Text    ${ALERTA_SWEET}
    Log To Console    Mensagem exibida: ${mensagem}
    Should Contain    ${mensagem}    ${MENSAGEM_ESPERADA}
    Click Element    ${BOTAO_OK_SWEET}
    Capture Page Screenshot

Fechar o navegador
    Close Browser
