

*** Settings ***
Library   Browser

# Set variables
*** Variables ***
${BROWSER}          chromium
${HEADLESS}         False
# Read old email, password and new email from environment variables
${CURRENT_EMAIL}    %{COPYMATIC_CURRENT_EMAIL}
${OLD_PASSWORD}     %{COPYMATIC_OLD_PASSWORD}
${NEW_PASSWORD}     %{COPYMATIC_NEW_PASSWORD}


*** Tasks ***
Change Email Address
    #
    # Open browser so that it is visible
    New Browser     ${BROWSER}      headless=${HEADLESS}
    #
    # Open the page where the login form is located
    New Page        https://copymatic.ai/
    #
    # Log in
    Click           xpath=(//a[@href="#"])[2]
    Fill Text       xpath=(//input[@name="username"])[2]    ${CURRENT_EMAIL}
    Fill Text       xpath=(//input[@name="password"])[1]    ${OLD_PASSWORD}
    Click           xpath=(//button[@class="submit_button"])[2]
    #
    # Navigate to the settings page
    Click           //div[@class="user_avatar"]
    Click           xpath=(//span)[12]
    #
    # Change the password
    Input Text      //input[@name="new-password"]           ${NEW_PASSWORD}
    Input Text      //input[@name="confirm-new-password"]   ${NEW_PASSWORD}
    Click Element   xpath=(//button[@class="btn white rounded shadow-sm btn-sm"])[2]