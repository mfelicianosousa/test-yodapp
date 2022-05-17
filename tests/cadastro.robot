*Settings*
Documentation       Suite de testes do cadastro de personagens

Resource        ${EXECDIR}/resources/base.robot

Test Setup      Start Session
Test Teardown   End Session

*Test Cases*
Deve cadastrar um novo personagem
    [Tags]  happy

    &{user}     Create Dictionary
    ...		    name=Mestre Yoada
    ...		    email=yoda@jedi.com
    ...		    ordem=Jedi
    ...		    tipoJedi=Cavaleiro Jedi
    ...		    birthDate=fevereiro-1970-20
    ...		    instagram=@ioda

    
    Go To User Form
    Fill User Form      ${user}    
    Select Jedi  ${user}[tipoJedi]
    Check Accept Comunications
    Submit User Form
    Toast Message Should Be     Usuário cadastrado com sucesso!
    
    #temporário
    Sleep       1

Email incorreto
    [Tags]      inv_email

     &{user}     Create Dictionary
    ...		    name=Dart Vader
    ...		    email=vader&hotmail.com 
    ...		    ordem=Sith
    ...		    birthDate=dezembro-1980-15
    ...		    instagram=@vader

    Go To User Form
    Fill User Form      ${user}                       
    Check Accept Comunications
    Submit User Form
    Toast Message Should Be     Oops! O email é incorreto







