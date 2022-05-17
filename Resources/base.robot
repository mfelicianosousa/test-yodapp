*Settings*
Documentation       Arquivo Principal do projeto

Library     Browser
Library     String

Resource    actions.robot

*Keywords*

Start Session
    New Browser     chromium    headless=False  slowMo=00:00:00
    #New Page        https://yodapp.vercel.app
    New page        https://yodapp-testing.vercel.app/

End Session
    Take Screenshot
