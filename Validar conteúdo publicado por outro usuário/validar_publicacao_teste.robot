*** Settings ***
Documentation    Teste automatizado para o fluxo de validação de publicação por um moderador.
Resource    validar_publicacao_resources.robot
Test Setup    Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT31 - Validar publicação de usuário como moderador
    [Documentation]    Testa o fluxo completo de validação de publicação por um moderador
    [Tags]    validar_publicacao_moderador
    Realizar login como moderador
    Acessar menu de usuários cadastrados
    Selecionar usuário com publicações
    Acessar aba de publicações
    Validar primeira publicação não verificada
    Confirmar validação da publicação
    Verificar Publicacao Validada