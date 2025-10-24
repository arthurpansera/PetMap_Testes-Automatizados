*** Settings ***
Documentation    Testes automatizados para o login de Cidadão no sistema.
Resource    login_cidadao_resources.robot
Test Setup    Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT5 - Realizar login com uma conta banida
    [Documentation]    Teste para verificar o comportamento do sistema ao tentar realizar login com uma conta banida.
    [Tags]   login_conta_banida
    Acessar página de login
    Informar o e-mail da conta banida
    Informar a senha
    Clicar no botão "Login"
    Verificar mensagem de erro indicando que a conta está banida

CT6 - Realizar login com um e-mail não cadastrado
    [Documentation]    Teste para verificar o comportamento do sistema ao tentar realizar login com um e-mail não cadastrado.
    [Tags]   login_email_nao_cadastrado
    Acessar página de login
    Informar um e-mail não cadastrado
    Informar a senha
    Clicar no botão "Login"
    Verificar mensagem de erro indicando que o e-mail não está cadastrado