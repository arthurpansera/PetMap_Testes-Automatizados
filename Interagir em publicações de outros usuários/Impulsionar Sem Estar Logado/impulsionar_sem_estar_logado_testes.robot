*** Settings ***
Documentation     Teste: clicar em "Impulsionar" sem estar logado
Resource          impulsionar_sem_estar_logado_resources.robot
Test Setup        Abrir Navegador
Test Teardown     Fechar o Navegador

*** Test Cases ***
CT18 - Clicar no botão "Impulsionar" em publicação sem estar logado
    [Documentation]    Garante que o sistema redireciona para o login quando o usuário tenta impulsionar sem estar autenticado.
    [Tags]    impulsionar_sem_estar_logado
    Acessar Página Principal
    Clicar no Botão Impulsionar
    Verificar Redirecionamento Para Login