*** Settings ***
Documentation               トップページのテスト
...
Metadata                    VERSION     0.1
Library                     Selenium2Library
# Suite Setup                 Start Browser
Suite Teardown              Close Browser
 
*** Variables ***
${SERVER}                   https://myapp.service.op/
 
*** Keywords ***
トップページを ${BROWSER} で表示する
    Open Browser            ${SERVER}   ${BROWSER}   None   ${REMOTE_URL}
    Title Should Be         ArangoAngularDemo
ヒーロー一覧が表示されること
    Wait Until Element Is Visible   css=ul.hero-list   10
 
*** Test Cases ***
ヒーロー一覧が表示されることのテスト
    [Documentation]         ヒーロー一覧が表示されることを確認する
    トップページを chrome で表示する
    ヒーロー一覧が表示されること
