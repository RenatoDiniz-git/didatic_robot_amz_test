*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${BROWSER}    chrome
${URL}    http://www.amazon.com.br
${MENU_ELETRONICOS}    //a[contains(text(),'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(text(),'Eletrônicos e Tecnologia')]


*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
Fechar o navegador
    Sleep    time_=2s 
    Capture Page Screenshot
    Close Browser
Acessar a home page do site Amazon.com.br
    Go To    url=${URL}   
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}
Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}
Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}
Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']
Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Wait Until Element Is Visible    locator=//input[@id='twotabsearchtextbox']
    Input Text    locator=//input[@id='twotabsearchtextbox']    text="${PRODUTO}"
Clicar no botão de pesquisa    
    Click Button    locator=//input[@id='nav-search-submit-button']
Verificar o resultado da pesquisa se está listando o produto "${VALIDA_PRODUTO}".
    Wait Until Element Is Visible    locator=(//span[contains(.,'${VALIDA_PRODUTO}')])[6]
    Element Should Contain    locator=(//span[contains(.,'${VALIDA_PRODUTO}')])[6]    expected=${VALIDA_PRODUTO}


    # robot -t "Caso de Teste 02 - Pesquisa de um Produto" amazon_teste.robot

    ###################################################GHEKIN STEPS#####################################################
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Sleep    time_=3s
    Verificar se o título da página fica "Amazon.com.br : "Xbox Series S""
E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S".

    ###################################################GHEKIN STEPS#####################################################