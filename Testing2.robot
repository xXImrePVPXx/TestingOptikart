*** Settings ***
Library           Selenium2Library

*** Test Cases ***
valid_login
    Open Browser    https://keprendeles.optikart.hu/login/    firefox
    Input Text    //*[@id="username-5474"]    Alejandro
    Input Password    //*[@id="user_password-5474"]    asdasdD2
    Click Element    //*[@id="um-submit-btn"]
    Element Should Contain    //*[@id="post-5477"]/header/h1    Teodoro Alejandro
    Close Browser

login_with_empty_username
    Open Browser    https://keprendeles.optikart.hu/login/    firefox
    Input Password    //*[@id="user_password-5474"]    asdasdD2
    Click Element    //*[@id="um-submit-btn"]
    Element Should Contain    //*[@id="um-error-for-username-5474"]    Please enter your username or email
    Close Browser

login_with_empty_password
    Open Browser    https://keprendeles.optikart.hu/login/    firefox
    Input Password    //*[@id="username-5474"]    Alejandro
    Click Element    //*[@id="um-submit-btn"]
    Element Should Contain    //*[@id="um-error-for-user_password-5474"]    Please enter your password
    Close Browser

login_with_empty_credentials
    Open Browser    https://keprendeles.optikart.hu/login/    firefox
    Click Element    //*[@id="um-submit-btn"]
    Element Should Contain    //*[@id="um-error-for-username-5474"]    Please enter your username or email
    Element Should Contain    //*[@id="um-error-for-user_password-5474"]    Please enter your password
    Close Browser

login_with_wrong_username
    Open Browser    https://keprendeles.optikart.hu/login/    firefox
    Input Text    //*[@id="username-5474"]    Alejandroo
    Input Password    //*[@id="user_password-5474"]    asdasdD2
    Click Element    //*[@id="um-submit-btn"]
    Element Should Contain    //*[@id="um-error-for-user_password-5474"]    Password is incorrect. Please try again.
    Close Browser
