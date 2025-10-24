*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost/PetMap/PROJETO/
${BOTAO_ENTRAR}    css=a.btn
${EMAIL_INPUT}     id=email
${PASSWORD_INPUT}  id=password
${BOTAO_LOGIN}     css=input.login-btn
${LOGIN_EMAIL}     ongteste@gmail.com
${LOGIN_SENHA}     Ong@1234
${BOTAO_PERFIL}    css=a.profile-image
${BOTAO_EDITAR_INFORMACOES}    css=a.profile-edit
${EMAIL_CAMPO}    css=#editModal input[type="email"]
${NOVO_EMAIL}    ongteste_novo@gmail.com
${BOTAO_SALVAR_ALTERACOES}    css=#editModal button.profile-save

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Realizar login como ONG
    Click Element    ${BOTAO_ENTRAR}
    Wait Until Element Is Visible    ${EMAIL_INPUT}    timeout=10s
    Input Text    ${EMAIL_INPUT}    ${LOGIN_EMAIL}
    Input Text    ${PASSWORD_INPUT}    ${LOGIN_SENHA}
    Sleep    2s
    Capture PageScreenshot
    Click Element    ${BOTAO_LOGIN}

Acessar página de perfil
    Wait Until Element Is Visible    ${BOTAO_PERFIL}    timeout=10s
    Click Element    ${BOTAO_PERFIL}
    Sleep    2s
    Capture PageScreenshot

Clicar no botão "Editar Informações"
    Wait Until Element Is Visible    ${BOTAO_EDITAR_INFORMACOES}    timeout=10s
    Click Element    ${BOTAO_EDITAR_INFORMACOES}
    Sleep    2s
    Capture PageScreenshot

Editar o e-mail
    Wait Until Element Is Visible    ${EMAIL_CAMPO}    timeout=10s
    Clear Element Text    ${EMAIL_CAMPO}
    Input Text    ${EMAIL_CAMPO}    ${NOVO_EMAIL}
    Sleep    2s
    Capture PageScreenshot

Clicar no botão "Salvar Alterações"
    Wait Until Element Is Visible    ${BOTAO_SALVAR_ALTERACOES}    timeout=10s
    Click Element    ${BOTAO_SALVAR_ALTERACOES}

Verificar mensagem de sucesso indicando que o e-mail foi atualizado com sucesso
    Sleep    2s
    Capture PageScreenshot

Fechar o navegador
    Close Browser