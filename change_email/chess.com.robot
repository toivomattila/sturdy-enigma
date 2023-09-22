

*** Settings ***
Library   Browser

# Set variables
*** Variables ***
${BROWSER}          chromium
${HEADLESS}         False
# Read old email, password and new email from environment variables
${CURRENT_EMAIL}    %{CHESSCOM_CURRENT_EMAIL}
${PASSWORD}         %{CHESSCOM_OLD_PASSWORD}
${NEW_EMAIL}        %{CHESSCOM_NEW_EMAIL}


*** Tasks ***
Change Email Address
    #
    # Open browser so that it is visible
    New Browser     ${BROWSER}      headless=${HEADLESS}
    #
    # Open the page where the login form is located
    New Page        https://chess.com/
    #
    # Decline cookies
    Click Element   //button[@class=" osano-cm-denyAll osano-cm-buttons__button osano-cm-button osano-cm-button--type_denyAll "]
    #
    # Login
    Click Element   xpath=(//span[@class="label"])[2]
    Input Text      //input[@name="_username"]    ${CURRENT_EMAIL}
    Input Text      //input[@name="_password"]    ${PASSWORD}
    Click Element   //button[@name="login"]
    #
    # Close the premium offer popup
    Click Element   //div[@class="icon-font-chess x ui_outside-close-icon"]
    #
    # Open the account settings
    Click Element   xpath=(//span[@class="nav-link-text"])[11]
    #
    # Open the email address changing form
    Click Link      xpath=(//a[@title="Change"])[2]
    #
    # Change the email address
    # Fill in password and the new email twice
    Input Text      //input[@name="change_email[password]"]         ${PASSWORD}
    Input Text      //input[@name="change_email[email][first]"]     ${NEW_EMAIL}
    Input Text      //input[@name="change_email[email][second]"]    ${NEW_EMAIL}
    #
    # Save the new email address
    Click Element   //button[@name="change_email[save]"]
