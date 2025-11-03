*** Settings ***
Documentation     Teste automatizado para verificar o comportamento ao clicar em "Impulsionar" em uma publicação já impulsionada.
Resource          impulsionar_publicacao_ja_impulsionada_resources.robot
Test Setup        Abrir Navegador
Test Teardown     Fechar o Navegador

*** Test Cases ***
CT16 - Clicar no botão "Impulsionar" em publicação que o usuário já impulsionou antes
    [Documentation]    Verifica se o sistema remove o impulso quando o usuário clica novamente em "Impulsionar" em uma publicação já impulsionada.
    [Tags]    impulsionar_publicacao_ja_impulsionada
    Fazer Login
    Acessar Página Principal
    Clicar no Botão Impulsionar
    Verificar Remocao Do Impulso