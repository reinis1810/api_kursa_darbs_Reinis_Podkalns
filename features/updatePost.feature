Feature: Post update feature
  Tests the update post functionality

  # 3uzd
  Scenario: Update post - update title
    Given I have logged in as a new regular user
    When I create a new post
    Then I check if the post is posted
    Given I have logged in as a regular user
    And I update posts title