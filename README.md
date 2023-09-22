# About

Tool to automate website credential management using RPA

Change email addresses or passwords on websites

Uses Robot Framework & Playwright

# How to use

### Pre-requirements

- pipenv
- npm

Python version is set to 3.10 in the Pipfile

Pyenv is recommended for managing different Python versions

## Install

1. Clone the repo
2. Install everything with `pipenv install`
3. Initialize the browser with `rfbrowser init`

## Use

1. Add the required environment variables (i.e. `.env`-file)
2. Run `robot <selected website>.robot`
    - For example: `robot change_email/copymatic.robot`

# Supported sites

## Changing the email address

- Chess.com
- Copymatic.ai

## Changing the password

- Copymatic.ai