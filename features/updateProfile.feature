Feature: Profile update feature
  Tests the update profile functionality

  # 2uzd
  Scenario: Update profile - update name and lastname
    Given I have logged in as a regular user
    Given I update name and lastname
    Then I check if profile is updated