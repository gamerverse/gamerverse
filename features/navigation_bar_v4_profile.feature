Feature: Navigation Bar v4 (Profile)
 
  As a user,
  I want to see a navigation bar on every page,
  So that I can navigate through the website
  
Background: user has been added to database

  Given the following users exist:
  | username | email           | password   | password_confirmation | zipcode | bio
  | test1    | test1@gmail.com | testing123 | testing123            | 11111   | hello1

  Then 1 seed users should exist
  
Scenario: Homepage to Profile Navigation
    Given I am logged in
    Given I am on the Home page
    Then I click the Profile link on the navigation bar
    And I should be redirected to the Profile page

Scenario: Games to Profile Navigation
    Given I am logged in
    Given I am on the Games page
    Then I click the Profile link on the navigation bar
    And I should be redirected to the Profile page

Scenario: Events to Profile Navigation
    Given I am logged in
    Given I am on the Events page
    Then I click the Profile link on the navigation bar
    And I should be redirected to the Profile page

Scenario: Homepage to Profile Navigation (sad path)
    Given I am logged out
    Given I am on the Home page
    Then I should not see a Profile link on the navigation bar

Scenario: Profile to Homepage Navigation
    Given I am logged in
    Given I am on the Profile page
    Then I click the Home link on the navigation bar
    And I should be redirected to the Home page

Scenario: Profile to Games Navigation
    Given I am logged in
    Given I am on the Profile page
    Then I click the Games link on the navigation bar
    And I should be redirected to the Games page

Scenario: Profile to Events Navigation
    Given I am logged in
    Given I am on the Profile page
    Then I click the Events link on the navigation bar
    And I should be redirected to the Events page

Scenario: Profile to Logout Navigation
    Given I am logged in
    Given I am on the Profile page
    Then I click the Logout link on the navigation bar
    Then I should be logged out
    And I should be redirected to the Home page