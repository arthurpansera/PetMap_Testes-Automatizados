*** Settings ***
Documentation    Teste automatizado para adicionar um arquivo inválido a uma publicação de animal perdido.
Resource    adicionar_foto_invalida_a_publicacao_resources.robot
Test Setup    Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT15 - Adicionar foto inválida à publicação
    [Documentation]    Tenta adicionar um arquivo inválido (não imagem) a uma publicação e verifica se a mensagem de erro correta é exibida.
    [Tags]    adicionar_foto_invalida_a_publicacao
    Realizar login
    Clicar no botão de realizar publicação
    Preencher o formulário da publicação
    Tentar adicionar arquivo inválido
    Verificar mensagem de erro de arquivo inválido