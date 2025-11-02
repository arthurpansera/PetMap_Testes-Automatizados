*** Settings ***
Documentation    Teste automatizado para adicionar um arquivo inválido a uma publicação de animal perdido.
Resource    adicionar_foto_invalida_a_publicacao_resources.robot
Test Setup    Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT15 - Upload de arquivo inválido
    Realizar login
    Clicar no botão de realizar publicação
    Preencher o formulário da publicação
    Tentar adicionar arquivo inválido
    Verificar mensagem de erro de arquivo inválido