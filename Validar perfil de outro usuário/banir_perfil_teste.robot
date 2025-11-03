*** Settings ***
Documentation    Teste automatizado para o fluxo de banimento de usuário por um moderador.
Resource    banir_perfil_resources.robot
Test Setup    Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT29 - Banir um usuário
    [Documentation]    Testa o fluxo completo de banimento de usuário por um moderador
    [Tags]    banir_usuario_moderador
    Realizar login como moderador
    Acessar menu de usuários cadastrados
    Selecionar primeiro usuário não banido
    Banir usuário
    Confirmar banimento
    Verificar se usuário foi banido
