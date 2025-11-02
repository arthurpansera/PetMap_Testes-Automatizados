*** Settings ***
Documentation     Testes automatizados para gerenciamento de publicações no PetMap.
Resource          publicacao_resource.robot
Test Setup        Abrir o navegador
Test Teardown     Fechar o navegador

*** Test Cases ***
CT12 - Excluir uma publicação
    [Documentation]   Teste para verificar o comportamento do sistema ao tentar excluir uma publicação existente.
    [Tags]    excluir_publicacao_existente
    Realizar login
    Acessar Pagina De Perfil
    Clicar No Botao Excluir De Alguma Publicacao
    Clicar No Botao Sim Excluir
    Verificar Exclusao Da Publicacao
    
CT14 - Não adicionar foto à publicação
    [Documentation]  Teste para verificar o comportamento do sistema ao tentar publicar um caso sem adicionar uma foto.  
    [Tags]    publicar_sem_foto
    Realizar login
    Acessar Pagina Principal
    Wait Until Element Is Visible    ${BOTAO_NOVA_PUBLICACAO}    timeout=${TEMPO_ESPERA}
    Click Element    ${BOTAO_NOVA_PUBLICACAO}
    Preencher o formulário da publicação sem inserir foto
    Clicar No Botao Publicar Para Envio
    Verificar Que Sistema Registrou Publicacao

CT10 - Editar o título de uma publicação existente
    [Documentation]    Teste para verificar o comportamento do sistema ao tentar editar o título de uma publicação existente.
    [Tags]    editar_titulo_publicacao
    Realizar login
    Acessar Pagina De Perfil
    Clicar No Botao Editar De Alguma Publicacao
    Editar O Titulo Da Publicacao    Novo título automatizado
    Clicar No Botao Salvar Alteracoes
    Verificar Edicao Do Titulo Com Sucesso    Novo título automatizado