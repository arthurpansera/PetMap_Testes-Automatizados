*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost/PetMap/PROJETO/
${BOTAO_ENTRAR}    css=a.btn
${EMAIL_INPUT}     id=email
${PASSWORD_INPUT}  id=password
${BOTAO_LOGIN}     css=input.login-btn
${EMAIL_CONTA_BANIDA}    arthur@gmail.com
${EMAIL_NAO_CADASTRADO}   nao_cadastrado@gmail.com
${SENHA}     Arp@1234

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Acessar página de login
    Click Element    ${BOTAO_ENTRAR}

Informar o e-mail da conta banida
    Wait Until Element Is Visible    ${EMAIL_INPUT}    timeout=10s
    Input Text    ${EMAIL_INPUT}    ${EMAIL_CONTA_BANIDA}

Informar um e-mail não cadastrado
    Wait Until Element Is Visible    ${EMAIL_INPUT}    timeout=10s
    Input Text    ${EMAIL_INPUT}    ${EMAIL_NAO_CADASTRADO}

Informar a senha
    Input Text    ${PASSWORD_INPUT}    ${SENHA}

Clicar no botão "Login"
    Click Element    ${BOTAO_LOGIN}

Verificar mensagem de erro indicando que a conta está banida
    Sleep    2s
    Capture PageScreenshot

Verificar mensagem de erro indicando que o e-mail não está cadastrado
    Sleep    2s
    Capture PageScreenshot

Fechar o navegador
    Close Browser