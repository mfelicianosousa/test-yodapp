*Settings*
Documentation   Ações customizadas do Yodapp

*Keywords*
Go To Home Page
    Go To   ${BASE_URL}

    Wait For Elements State     css=.carousel   visible     5



Go To User Form


    # {Dado} que acesso o formulário de cadastro

    Click   text=Novo

    # Checkpoint (Para saber se fomos de fato para a página de cadastro)
    Wait For Elements State     css=.card-header-title >> text=Cadastrar novo usuário
    ...     visible     5

Fill User Form
    [Arguments]     ${user}
 # {Quando) preencho esse formulário com os dados do Mestre Yoda
    Fill Text   css=input[name="nome"]       ${user}[name]
    Fill Text   css=input[name="email"]     ${user}[email]
  
    Select Options By   css=.ordem select   text   ${user}[ordem]

    Select Birth Date   ${user}[birthDate]

    Fill Text   id=insta    ${user}[instagram]

Select Jedi
    [Arguments]     ${tipoJedi}

    Click   xpath=//input[@value="${tipoJedi}"]/..//span[@class="check"]

Check Accept Comunications
    Click   xpath=//input[@name="comunications"]/../span[@class="check"]

# Calendario
Select Birth Date
    #[Arguments]     ${month}    ${year}    ${day}
    [Arguments]     ${text_date}

    @{date}         Split String     ${text_date}   -


    Click       css=input[name="Data de nascimento"] 

    Select Options By   xpath=(//header[@class="datepicker-header"]//select)[1]
    ...                 text    ${date}[0]
    Select Options By   xpath=(//header[@class="datepicker-header"]//select)[2]
    ...                 value    ${date}[1]
    Click   xpath=//a[contains(@class,"datepicker-cell")]//span[text()="${date}[2]"]



Submit User Form
    # {E} (complemento do quando) submeto esse formulário
    Click   css=button >> text=Cadastrar

Toast Message Should Be
    [Arguments]     ${expected_message}

    ${element}      Set Variable    css=.toast div   

    Wait For Elements State     ${element}  visible     5
    Get Text                    ${element}  equal       ${expected_message}

User Should Be Visible
    [Arguments]     ${user}

    ${element}      Set Variable    xpath=//td[contains(text(),"${user}[email]")]/..    

    Wait For Elements State     ${element}  visible    5
    Get Text    ${element}      contains    ${user}[name]
    Get Text    ${element}      contains    ${user}[instagram]



