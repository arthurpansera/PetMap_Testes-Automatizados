*** Settings ***
Documentation    Teste automatizado para o cadastro de ONG no sistema.
Resource    cadastro_ong_resources.robot
Test Setup    Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT03 - Editar e-mail após cadastro
    [Documentation]    Teste para verificar o comportamento do sistema ao tentar editar o e-mail de uma ONG após o cadastro.
    [Tags]   editar_email_ong
    Realizar login como ONG
    Acessar página de perfil
    Clicar no botão "Editar Informações"
    Editar o e-mail
    Clicar no botão "Salvar Alterações"
    Verificar mensagem de sucesso indicando que o e-mail foi atualizado com sucesso