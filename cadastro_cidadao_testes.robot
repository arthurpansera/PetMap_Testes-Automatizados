*** Settings ***
Resource    cadastro_cidadao_resources.robot
Test Setup    Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT1 - Cadastrar cidadão sem nome
    [Documentation]    Teste para verificar o comportamento do sistema ao tentar cadastrar um cidadão sem nome.
    [Tags]   cadastrar_cidadao_sem_nome
    Acessar página de cadastro
    Selecionar opção de "Cidadão"
    Preencher dados do formulário de cadastro, mas deixar o campo "Nome" em branco
    Clicar no botão "Cadastrar-se"

CT2 - Cadastrar cidadão com e-mail já vinculado a outra conta
    [Documentation]    Teste para verificar o comportamento do sistema ao tentar cadastrar um cidadão com e-mail já vinculado a outra conta.
    [Tags]   cadastrar_cidadao_com_email_ja_vinculado
    Acessar página de cadastro
    Selecionar opção de "Cidadão"
    Preencher dados do formulário de cadastro e informar um e-mail já cadastrado no campo de "E-mail"
    Clicar no botão "Cadastrar-se"