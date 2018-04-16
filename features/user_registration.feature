Feature: User Registration
  
  As a new user,
  I want to register for a new account,
  So that I can have my own preferences and use all the website's features

Background: users have been added to database

  Given the following users exist:
  | username | email           | password   | password_confirmation | zipcode | bio
  | test1    | test1@gmail.com | testing123 | testing123            | 11111   | hello1

  Then 1 seed users should exist
  
Scenario: Create a user with no errors
  Given I am on the Register page
  And I set Username to test2
  And I set Email to test2@gmail.com
  And I set Zip Code to 11111
  And I set Password to password
  And I set Confirm Password to password
  And I click the Submit button
  Then I should be redirected to the Home page

Scenario: Create a user when the username is taken
  Given I am on the Register page
  And I set Username to test1
  And I set Email to test2@gmail.com
  And I set Zip Code to 11111
  And I set Password to password
  And I set Confirm Password to password
  And I click the Submit button
  Then I should be redirected to the Register page
  And I should see an error message for Username

Scenario: Create a user when the username has errors
  Given I am on the Register page
  And I set Username to MoreThan12Characters
  And I set Email to test2@gmail.com
  And I set Zip Code to 11111
  And I set Password to password
  And I set Confirm Password to password
  And I click the Submit button
  Then I should be redirected to the Register page
  And I should see an error message for Username

Scenario: Create a user when the email is taken
  Given I am on the Register page
  And I set Username to test3
  And I set Email to test1@gmail.com
  And I set Zip Code to 11111
  And I set Password to password
  And I set Confirm Password to password
  And I click the Submit button
  Then I should be redirected to the Register page
  And I should see an error message for Email

Scenario: Create a user when the email has errors
  Given I am on the Register page
  And I set Username to test4
  And I set Email to test
  And I set Zip Code to 11111
  And I set Password to password
  And I set Confirm Password to password
  And I click the Submit button
  Then I should be redirected to the Register page
  And I should see an error message for Email

Scenario: Create a user when the zipcode has errors
  Given I am on the Register page
  And I set Username to test5
  And I set Email to test5@gmail.com
  And I set Zip Code to 1
  And I set Password to password
  And I set Confirm Password to password
  And I click the Submit button
  Then I should be redirected to the Register page
  And I should see an error message for ZipCode

Scenario: Create a user when the password has errors
  Given I am on the Register page
  And I set Username to test6
  And I set Email to test6@gmail.com
  And I set Zip Code to 11111
  And I set Password to pass
  And I set Confirm Password to pass
  And I click the Submit button
  Then I should be redirected to the Register page
  And I should see an error message for Password

Scenario: Create a user when the passwords don't match
  Given I am on the Register page
  And I set Username to test7
  And I set Email to test7@gmail.com
  And I set Zip Code to 11111
  And I set Password to password
  And I set Confirm Password to notpassword
  And I click the Submit button
  Then I should be redirected to the Register page
  And I should see an error message for Password confirmation