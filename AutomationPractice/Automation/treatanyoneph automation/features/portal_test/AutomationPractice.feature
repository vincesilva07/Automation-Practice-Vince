Feature: To test the automation practice project using ruby watir cucumber framework

Background: Open the browser and go to Automation Practice
Given I am on Automation Practice homepage

Scenario Outline: Test signup success with sign in, adding new address and sign out
When I try to create account using email address "<email>" on the webpage
And fill out all needed data on the signup forms
And I login to portal using email "<email>" and password "Testing123"
And There should be a text displayed on the page like "My account"
And There should be a text displayed on the page like "Welcome to your account. Here you can manage all of your personal information and orders."
Then The message displayed in the URL should be "my-account"
When I click link "My addresses" on the web page
Then There should be a text displayed on the page like "Your addresses are listed below."
When I click link "Add a new address" on the web page
And fill out all needed data using "valid" Address
Then There should be a text displayed on the page like "TESTING123"
And The message displayed in the URL should be "addresses"
And I sign out in the automation practice page
And There should be a text displayed on the page like "Sign in"
Examples:
|email|
|apexamvincentsilva1@yopmail.com|
|apexamvincentsilva2@yopmail.com|
|apexamvincentsilva3@yopmail.com|

Scenario: Test signup fails using already used email address
When I try to create account using email address "testapv1@yopmail.com" on the webpage
Then There should be a text displayed on the page like "An account using this email address has already been registered. Please enter a valid password or request a new one."

Scenario Outline: Test if error message will display after user provide invalid credentials
When I login to portal using email "<email>" and password "<pwd>"
Then There should be a text displayed on the page like "<msg>"
Examples:
| email                           |  pwd    | msg                       |
| test                            |  test   | Invalid email address.    |
|                                 |  test   | An email address required.|
| testapv1@yopmail.com            |         | Password is required.     |

Scenario: Test if adding duplicate Address name will display an error
When I login to portal using email "testapv1@yopmail.com" and password "Testing123"
And I click link "My addresses" on the web page
And I click link "Add a new address" on the web page
And fill out all needed data using "valid" Address
Then There should be a text displayed on the page like "There is 1 error"
And There should be a text displayed on the page like "Please select another one."

Scenario: Test if entering empty credentials in updating address name will display an error
When I login to portal using email "testapv1@yopmail.com" and password "Testing123"
And I click link "My addresses" on the web page
And I click link "Update" on the web page
And fill out all needed data using "invalid" Address
Then There should be a text displayed on the page like "address1 is required."
And There should be a text displayed on the page like "city is required."
And There should be a text displayed on the page like "This country requires you to chose a State."
And There should be a text displayed on the page like "The Zip/Postal code you've entered is invalid. It must follow this format: 00000"
And There should be a text displayed on the page like "You must register at least one phone number."
And There should be a text displayed on the page like "alias is required."

# generate report
# cucumber -f pretty -f html -o report.html
