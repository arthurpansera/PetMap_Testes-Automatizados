*** Settings ***
Documentation    Teste automatizado para o fluxo de remoção de publicação por um moderador.
Resource    remover_publicacao_resources.robot
Test Setup    Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT32 - Remover uma publicação realizada por outro usuário
    [Documentation]    Testa o fluxo completo de remoção de publicação por um moderador
    [Tags]    remover_publicacao_moderador
    Realizar login como moderador
    Acessar menu de usuários cadastrados
    Selecionar usuário com publicações
    Acessar aba de publicações
    Remover primeira publicação
    Confirmar remoção da publicação
    Verificar se publicação foi removida