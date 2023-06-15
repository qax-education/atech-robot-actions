*** Settings ***
Documentation            Arquivo principal do robot

Library        Browser

Resource        env.resource
Resource        ./pages/LoginPage.resource

*** Keywords ***
Start Session

    New Browser        browser=chromium        headless=True
    New Page           ${BASE_URL}

Finish Session

    Take Screenshot
