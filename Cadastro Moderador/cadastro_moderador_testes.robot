*** Settings ***
Documentation    Teste automatizado para o cadastro de moderador no sistema.
Resource    cadastro_moderador_resources.robot
Test Setup    Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT04 - Excluir conta de moderador
    [Documentation]    Teste para verificar o comportamento do sistema ao tentar excluir a conta de um moderador.
    [Tags]   excluir_conta_moderador
    Realizar login como moderador
    Acessar página de perfil
    Clicar no botão "Excluir Conta"
    Clicar no botão de confirmação "Sim, excluir"
    Verificar se retorna para a página de login