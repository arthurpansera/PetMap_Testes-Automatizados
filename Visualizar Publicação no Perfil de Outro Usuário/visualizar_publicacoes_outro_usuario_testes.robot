*** Settings ***
Documentation     Teste automatizado para verificar a visualização das publicações no perfil de outro usuário.
Resource          visualizar_publicacoes_outro_usuario_resources.robot
Test Setup        Abrir Navegador
Test Teardown     Fechar o Navegador

*** Test Cases ***
Visualizar Publicacoes No Perfil De Outro Usuario
    [Documentation]    Verifica se o sistema exibe corretamente as publicações do perfil de outro usuário pesquisado.
    Acessar Página Principal
    Inserir Nome Na Barra De Pesquisa    Steh
    Selecionar Usuario Da Lista
    Rolar Ate As Publicacoes
    Verificar Exibicao Das Publicacoes