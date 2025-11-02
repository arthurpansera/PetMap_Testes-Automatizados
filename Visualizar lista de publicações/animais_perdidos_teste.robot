*** Settings ***
Documentation    Teste automatizado para verificar o acesso à página "Animais Perdidos".
Resource    animais_perdidos_resources.robot
Test Setup    Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT20 - Acessar página de animais perdidos e verificar mensagem de ausência de publicações
    [Documentation]    Verifica se a página "Animais Perdidos" é acessada corretamente e exibe a mensagem "Não há publicações disponíveis".
    [Tags]    acessar_animais_perdidos
    Acessar página principal
    Acessar página "Animais Perdidos"
    Verificar mensagem "Não há publicações disponíveis"
