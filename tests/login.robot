*** Settings ***
Documentation        Testes de login

Resource        ../resources/base.resource

Test Setup        Start Session
Test Teardown     Finish Session

*** Test Cases ***
Deve logar com sucesso
    
    Submit login form    qa    xperience
    Pop up should be     Suas credenciais são válidas :)

Não deve logar se a senha for incorreta
    [Tags]        inv_pass

    Submit login form    qa    123456
    Toast should be      Oops! Credenciais inválidas :(

Usuário deve ser obrigatório

    Submit login form    ${EMPTY}    123456
    Toast should be      Informe o seu nome de usuário!

Senha deve ser obrigatória

    Submit login form    qa    ${EMPTY}
    Toast should be      Informe a sua senha secreta!
    