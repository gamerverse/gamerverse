Feature: Profile Page

  As an existing user,
  I want to access my profile,
  So that I can view my information

Background: users have been added to database
  Given the following users exist:
  | username | email           | password   | password_confirmation | zipcode | bio
  | test1    | test1@gmail.com | testing123 | testing123            | 11111   | hello1

  Then 1 seed users should exist

Scenario: View the profile page
  Given I am logged in
  Given I am on the Profile page
  Then I should see a Profile Page section
  And I should see a Profile Page section
  And I should see a Favorite Games section
  And I should see a Events I'm Attending section
  And I should see a Edit Profile link

Scenario: Click on the Edit Profile link
  Given I am logged in
  Given I am on the Profile page
  Then I should see a Edit Profile link
  And I click the Edit Profile link
  And I should be redirected to the Edit Profile page