*** Settings ***
Documentation    Teste automatizado para o fluxo de validação de perfil por um moderador.
Resource    banir_perfil_resources.robot
Test Setup    Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Cenário: Banir usuário como moderador
    [Documentation]    Testa o fluxo completo de banimento de usuário por um moderador
    Abrir o navegador
    Realizar login como moderador
    Acessar menu de usuários cadastrados
    Selecionar primeiro usuário não banido
    Banir usuário
    Confirmar banimento
    Verificar se usuário foi banido
    Fechar o navegador