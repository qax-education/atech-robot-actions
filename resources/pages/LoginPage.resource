*** Settings ***
Documentation        Ações e elementos da página de login

Library    Browser

*** Keywords ***
Submit login form
    [Arguments]        ${user}    ${password}

    Fill Text        css=input[name=user]    ${user}
    Fill Text        css=input[name=pass]    ${password}

    Click        css=button >> text=Entrar

Pop up should be
    [Arguments]        ${expected_text}

    ${element}        Set Variable        css=.swal2-html-container

    Wait For Elements State     ${element}
    ...    visible        5
    
    Get Text        ${element}        equal      ${expected_text}  

Toast should be
    [Arguments]        ${expected_text}

    ${element}        Set Variable    css=.toast-message div[role=status]

    Wait For Elements State     ${element}
    ...    visible        5
    
    Get Text        ${element}       equal      ${expected_text} 