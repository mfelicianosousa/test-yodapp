*Settings*
Documentation       Suite de testes do cadastro de personagens

Resource        ${EXECDIR}/resources/base.robot

Test Setup      Start Session
Test Teardown   End Session

*Test Cases*
Deve cadastrar um novo personagem
    [Tags]  happy
    
    Go To User Form
    Fill User Form      Mestre Yoda     yoda@jedi.com   Jedi    fevereiro-1970-20   @yoda    
    Select Jedi  Cavaleiro Jedi
    Check Accept Comunications
    Submit User Form
    Toast Message Should Be     Usuário cadastrado com sucesso!
    
    #temporário
    Sleep       1

Email incorreto
    [Tags]      inv_email

    Go To User Form
    Fill User Form      Dart Vader      vader&hotmail.com  Sith    dezembro-1980-15   @vader   
    Check Accept Comunications
    Submit User Form
    Toast Message Should Be     Oops! O email é incorreto







