*** Settings ***
Documentation    Teste automatizado para o fluxo de validação de perfil por um moderador.
Resource    validar_perfil_resources.robot
Test Setup    Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT28 - Validar perfil de usuário como moderador
    [Documentation]    Testa o fluxo completo de validação de perfil por um moderador
    [Tags]    validar_perfil_moderador
    Realizar login como moderador
    Acessar menu de usuários cadastrados
    Selecionar primeiro usuário não verificado
    Validar perfil do usuário
    Confirmar validação
    Verificar se perfil foi validado
