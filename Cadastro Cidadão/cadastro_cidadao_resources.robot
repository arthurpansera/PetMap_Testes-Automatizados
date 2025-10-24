*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost/PetMap/PROJETO/
${BOTAO_ENTRAR}    css=a.btn
${BOTAO_CADASTRO}    css=a.show-register
${BOTAO_CIDADAO}    link=Cidadão
${BOTAO_CADASTRO_CIDADAO}    css=input.register-btn

${NAME}    id=name
${CPF}    id=cpf
${BIRTHYEAR}    id=birthYear
${TELEPHONE}    id=telephone
${EMAIL}    id=email
${PASSWORD}    id=password
${CONFIRM_PASS}    id=confirm-pass
${CEP}    id=CEP
${ROAD}    id=road
${NUM}    id=num
${NEIGHBORHOOD}    id=neighborhood
${CITY}    id=city
${STATE}    id=state
${COUNTRY}    id=country
${COMPLEMENT}    id=complement

${CT1_NAME_VALOR}    
${CT1_CPF_VALOR}    123.456.789-00
${CT1_BIRTHYEAR_VALOR}    01/01/1990
${CT1_TELEPHONE_VALOR}    (41) 91234-5678
${CT1_EMAIL_VALOR}    teste@exemplo.com
${CT1_PASSWORD_VALOR}    Senha@1234
${CT1_CEP_VALOR}    01001-000
${CT1_NUM_VALOR}    123
${CT1_COMPLEMENT_VALOR}    Apto 101

${CT2_NAME_VALOR}    João Silva
${CT2_CPF_VALOR}    987.654.321-00
${CT2_BIRTHYEAR_VALOR}    02/02/1985
${CT2_TELEPHONE_VALOR}    (41) 98765-4321
${CT2_EMAIL_VALOR}    joao@gmail.com
${CT2_PASSWORD_VALOR}    Senha@5678
${CT2_CEP_VALOR}    22050-031
${CT2_NUM_VALOR}    456
${CT2_COMPLEMENT_VALOR}    Casa

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Acessar página de cadastro
    Wait Until Page Contains Element    ${BOTAO_ENTRAR}    timeout=10s
    Click Element    ${BOTAO_ENTRAR}
    Wait Until Page Contains Element    ${BOTAO_CADASTRO}    timeout=10s
    Click Element    ${BOTAO_CADASTRO}
    Sleep    2s
    Capture PageScreenshot

Selecionar opção de "Cidadão"
    Wait Until Page Contains Element    ${BOTAO_CIDADAO}    timeout=10s
    Click Link    ${BOTAO_CIDADAO}
    Sleep    2s
    Capture PageScreenshot

Preencher dados do formulário de cadastro, mas deixar o campo "Nome" em branco
    Wait Until Page Contains Element    ${NAME}    timeout=10s
    Input Text    ${NAME}    ${CT1_NAME_VALOR}
    Input Text    ${CPF}    ${CT1_CPF_VALOR}
    Input Text    ${BIRTHYEAR}    ${CT1_BIRTHYEAR_VALOR}
    Input Text    ${TELEPHONE}    ${CT1_TELEPHONE_VALOR}
    Input Text    ${EMAIL}    ${CT1_EMAIL_VALOR}
    Input Text    ${PASSWORD}    ${CT1_PASSWORD_VALOR}
    Input Text    ${CONFIRM_PASS}    ${CT1_PASSWORD_VALOR}
    Input Text    ${CEP}    ${CT1_CEP_VALOR}
    Input Text    ${NUM}    ${CT1_NUM_VALOR}
    Input Text    ${COMPLEMENT}    ${CT1_COMPLEMENT_VALOR}
    Sleep    2s
    Capture PageScreenshot

Preencher dados do formulário de cadastro e informar um e-mail já cadastrado no campo de "E-mail"
    Wait Until Page Contains Element    ${NAME}    timeout=10s
    Input Text    ${NAME}    ${CT2_NAME_VALOR}
    Input Text    ${CPF}    ${CT2_CPF_VALOR}
    Input Text    ${BIRTHYEAR}    ${CT2_BIRTHYEAR_VALOR}
    Input Text    ${TELEPHONE}    ${CT2_TELEPHONE_VALOR}
    Input Text    ${EMAIL}    ${CT2_EMAIL_VALOR}
    Input Text    ${PASSWORD}    ${CT2_PASSWORD_VALOR}
    Input Text    ${CONFIRM_PASS}    ${CT2_PASSWORD_VALOR}
    Input Text    ${CEP}    ${CT2_CEP_VALOR}
    Input Text    ${NUM}    ${CT2_NUM_VALOR}
    Input Text    ${COMPLEMENT}    ${CT2_COMPLEMENT_VALOR}
    Sleep    2s
    Capture PageScreenshot

Clicar no botão "Cadastrar-se"
    Wait Until Page Contains Element    ${BOTAO_CADASTRO_CIDADAO}    timeout=10s
    Click Element    ${BOTAO_CADASTRO_CIDADAO}

Verificar mensagem de erro indicando que o campo "Nome" é obrigatório
    Sleep    2s
    Capture PageScreenshot

Verificar mensagem de erro indicando que o e-mail já está vinculado a outra conta
    Sleep    2s
    Capture PageScreenshot

Fechar o navegador
    Close Browser