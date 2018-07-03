Feature: Profile update feature
  Tests the update profile functionality

  Scenario: Log in - update name and lastname
    Given I have logged in as a regular user
    Given I update name and lastname
    Then I check if profile is updated