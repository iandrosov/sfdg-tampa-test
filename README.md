# Salesforce DG Tampa Sample App for Meeting 04-18-2019

This is a sample app to demonstrate the Unit Tests in APEX. Provided as SFDX project for simple distribution to scratch org or DEV/Sandbox.

## Installation Instructions

There are two ways to install SFDGTampa App:

-   [Using Salesforce DX](#installing-using-salesforce-dx): This is the recommended installation option. Use this option if you are a developer who may want to customize the app and may be contribute to this project code.
-   [Using an Unlocked Package](#installing-using-unlocked-package): This option allows anybody to install and use the App without installing a local development environment.

## Installing using Salesfroce DX

1. Set up your environment. Follow the steps in the [Quick Start: Lightning Web Components](https://trailhead.salesforce.com/content/learn/projects/quick-start-lightning-web-components/) Trailhead project. The steps include:

    - Sign up for a Developer org and enable Dev Hub
    - Install the current version of the Salesforce CLI
    - Install Visual Studio Code
    - Install the Visual Studio Code Salesforce extensions, including the Lightning Web Components extension

1. If you haven't already done so, authenticate with your DevHub org and provide it with an alias (spring19hub):

    ```
    sfdx force:auth:web:login -d -a DevHub
    ```

1. Clone the sfdg-tampa-test repository:

    ```
    git clone https://github.com/iandrosov//sfdg-tampa-test
    cd /sfdg-tampa-test
    ```

1. Create a scratch org and provide it with an alias (**sfdgtampa** in the command below):

    ```
    sfdx force:org:create -s -f config/project-scratch-def.json -a sfdg-tampa-test
    ```

1. Push the app to your scratch org:

    ```
    sfdx force:source:push
    ```

1. Open the scratch org:

    ```
    sfdx force:org:open
    ```
## Installing Using Unlocked Package

1. [Sign up](https://developer.salesforce.com/signup) for a Developer org, enable My Domain, and deploy it to all users.

1. Click [this link](https://login.salesforce.com/packaging/installPackage.apexp?p0=04t3Z000001adooQAA) to install the unlocked package in your Developer org.

1. Select **Install for All Users**

Note if you are installing on Traiulhead Playground and do not know your user password you can copy th package part of url adn add this tiy yiour TP org instance URL and that shoukd enable to install the package.

```
<INstance URL>/packaging/installPackage.apexp?p0=04t3Z000001adooQAA
```

## Resources