*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${BROWSER}                  Chrome
${URL}                      http://localhost/PetMap/PROJETO/
${BOTAO_ENTRAR}             css=a.btn
${EMAIL_INPUT}              id=email
${PASSWORD_INPUT}           id=password
${BOTAO_LOGIN}              css=input.login-btn
${EMAIL_CONTA}              maria@gmail.com
${SENHA_CONTA}              maria@1234

${BOTAO_NOVA_PUBLICACAO}    css=button.floating-button
${INPUT_TITULO}             id=titulo
${INPUT_CONTEUDO}           id=conteudo
${SELECT_TIPO}              id=tipo_publicacao
${INPUT_RUA}                id=endereco_rua
${INPUT_BAIRRO}             id=endereco_bairro
${INPUT_CIDADE}             id=endereco_cidade
${SELECT_ESTADO}            id=state
${BOTAO_PUBLICAR}           css=button.create-post

${INPUT_FOTOS}              id=foto_publicacao
${ALERTA_SWEET}             css=.swal2-html-container
${BOTAO_OK_SWEET}           css=button.swal2-confirm
${MENSAGEM_ESPERADA_INVALIDO}    Apenas imagens JPEG, JPG e PNG são permitidas.

${TITULO_VALOR}             Teste arquivo inválido
${CONTEUDO_VALOR}           Tentando adicionar um arquivo não suportado.
${RUA_VALOR}                Rua das Flores
${BAIRRO_VALOR}             Centro
${CIDADE_VALOR}             Curitiba

${ARQUIVO_INVALIDO}         ${EXECDIR}/Adicionar foto do animal à publicação/Arquivos/TXT-TESTE.txt

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Realizar login
    Wait Until Element Is Visible    ${BOTAO_ENTRAR}    timeout=10s
    Click Element    ${BOTAO_ENTRAR}
    Wait Until Element Is Visible    ${EMAIL_INPUT}    timeout=10s
    Input Text    ${EMAIL_INPUT}    ${EMAIL_CONTA}
    Input Text    ${PASSWORD_INPUT}    ${SENHA_CONTA}
    Click Element    ${BOTAO_LOGIN}

Clicar no botão de realizar publicação
    Wait Until Element Is Visible    ${BOTAO_NOVA_PUBLICACAO}    timeout=10s
    Click Element    ${BOTAO_NOVA_PUBLICACAO}
    Sleep    1s

Preencher o formulário da publicação
    Wait Until Element Is Visible    ${INPUT_TITULO}    timeout=10s
    Input Text    ${INPUT_TITULO}    ${TITULO_VALOR}
    Input Text    ${INPUT_CONTEUDO}    ${CONTEUDO_VALOR}
    Select From List By Value    ${SELECT_TIPO}    animal
    Input Text    ${INPUT_RUA}    ${RUA_VALOR}
    Input Text    ${INPUT_BAIRRO}    ${BAIRRO_VALOR}
    Input Text    ${INPUT_CIDADE}    ${CIDADE_VALOR}
    Select From List By Value    ${SELECT_ESTADO}    PR

Tentar adicionar arquivo inválido
    [Documentation]    Tenta enviar um arquivo que não é imagem
    Choose File    ${INPUT_FOTOS}    ${ARQUIVO_INVALIDO}

Verificar mensagem de erro de arquivo inválido
    [Documentation]    Verifica se a mensagem de erro foi exibida
    Wait Until Element Is Visible    ${ALERTA_SWEET}    timeout=10s
    ${mensagem}=    Get Text    ${ALERTA_SWEET}
    Log To Console    Mensagem exibida: ${mensagem}
    Should Contain    ${mensagem}    ${MENSAGEM_ESPERADA_INVALIDO}
    Click Element    ${BOTAO_OK_SWEET}

Fechar o navegador
    Close Browser