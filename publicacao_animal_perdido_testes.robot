*** Settings ***
Documentation    Testes automatizados para a publicação de casos de animal perdido no sistema.
Resource    publicacao_animal_perdido_resources.robot    
Test Setup    Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT7 - Realizar publicação de caso de animal perdido
    [Documentation]    Teste para verificar o fluxo de realizar uma publicação de caso de animal perdido no sistema.
    [Tags]   publicacao_animal_perdido
    Realizar login
    Acessar página principal
    Clicar no botão de realizar publicação no canto inferior direito
    Preencher o formulário da publicação
    Clicar no botão "Publicar"
    Verificar se a publicação foi registrada com sucesso

CT8 - Editar o título após ter realizado a publicação de um caso de animal perdido
    [Documentation]    Teste para verificar o fluxo de editar o título de uma publicação de caso de animal perdido no sistema.
    [Tags]   editar_publicacao_animal_perdido
    Realizar login
    Acessar a página de perfil
    Clicar no botão "Editar" de alguma publicação
    Editar o título da publicação
    Clicar no botão "Salvar Alterações"
    Verificar se a alteração foi salva com sucesso