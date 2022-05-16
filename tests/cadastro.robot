*Settings*
Documentation       Suite de testes do cadastro de personagens

Resource        ${EXECDIR}/resources/base.robot

Test Setup      Start Session
Test Teardown   End Session

*Test Cases*
Deve cadastrar um novo personagem
    [Tags]  happy
    
    # {Dado} que acesso o formulário de cadastro

    Click   text=Novo

    # Checkpoint (Para saber se fomos de fato para a página de cadastro)
    Wait For Elements State     css=.card-header-title >> text=Cadastrar novo usuário
    ...     visible     5

    # {Quando) preencho esse formulário com os dados do Mestre Yoda
    Fill Text   css=input[placeholder="Nome"]      Mestre Yoada
    Fill Text   css=input[placeholder="Email"]      yoda@jedi.com
  
    Select Options By   css=.ordem select   text   Jedi
    #Click   css=input[type=radio][value="Cavaleiro Jedi"]
    #Click   css=input[type=radio][value="Padawan"]

    Click   xpath=//input[@value="Cavaleiro Jedi"]/..//span[@class="check"]

    Select Birth Date   fevereiro-1970-20
    Fill Text   id=insta    @yoda

    Click   xpath=//input[@name="comunications"]/../span[@class="check"]

    # {E} (complemento do quando) submeto esse formulário
    Click   css=button >> text=Cadastrar

    # {Então} devo ver a mensagem de sucesso
    # Sleep       1
    # ${html}     Get Page Source
    # Log         ${html}

    Wait For Elements State     css=.toast div >> text=Usuário cadastrado com sucesso!
    ...                         visible     5

    #temporário
    Sleep       1

Email incorreto
    [Tags]      inv_email
  
    # {Dado} que acesso o formulário de cadastro

    Click   text=Novo

    # Checkpoint (Para saber se fomos de fato para a página de cadastro)
    Wait For Elements State     css=.card-header-title >> text=Cadastrar novo usuário
    ...     visible     5

    # {Quando) preencho esse formulário com os dados do Mestre Yoda
    Fill Text   css=input[placeholder^="Nome"]      Dart Vader
    Fill Text   css=input[placeholder="Email"]      vader&hotmail.comunications
  
    Select Options By   css=.ordem select   text   Sith

    Select Birth Date   dezembro-1980-15
    Fill Text   id=insta    @Vader

    Click   xpath=//input[@name="comunications"]/../span[@class="check"]

    # {E} (complemento do quando) submeto esse formulário
    Click   css=button >> text=Cadastrar

    Wait For Elements State     css=.toast div >> text=Oops! O email é incorreto
    ...                         visible     5




*Keywords*
# Calendario
Select Birth Date
    #[Arguments]     ${month}    ${year}    ${day}
    [Arguments]     ${text_date}

    @{date}         Split String     ${text_date}   -


    Click       css=input[placeholder="Data de nascimento"] 

    Select Options By   xpath=(//header[@class="datepicker-header"]//select)[1]
    ...                 text    ${date}[0]
    Select Options By   xpath=(//header[@class="datepicker-header"]//select)[2]
    ...                 value    ${date}[1]
    Click   xpath=//a[contains(@class,"datepicker-cell")]//span[text()="${date}[2]"]







