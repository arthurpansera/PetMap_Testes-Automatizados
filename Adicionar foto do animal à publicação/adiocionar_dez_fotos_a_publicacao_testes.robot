*** Settings ***
Documentation    Teste automatizado para adicionar dez fotos a uma publicação de animal perdido.
Resource    adiocionar_dez_fotos_a_publicacao_resources.robot
Test Setup    Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT14 - Adicionar foto do animal à publicação
    [Documentation]    Testa se o sistema aceita até 8 fotos e rejeita quando tentar adicionar mais
    [Tags]   adicionar_10_fotos_na_publicacao
    Realizar login
    Clicar no botão de realizar publicação
    Preencher o formulário da publicação CT14
    Adicionar 10 fotos à publicação
    Verificar se o limite de fotos foi respeitado