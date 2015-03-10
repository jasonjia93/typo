Feature: Merge Articles
  As a blog administrator
  In order to make the blog more concise and eliminate redundancy
  I want to be able to merge articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: A non-admin cannot merge articles
    When I go to the home page
    And I follow "Hello World!"
    Then I should not see /edit

  Scenario: Merged article should contain text of both previous articles
    When I merge article "1" with article "2"
    And I view article "1"
    Then I should see "Welcome to Typo. This is your first article. Edit or delete it, then start blogging! Welcome to Typo. This is your first article. Edit or delete it, then start blogging!"

  Scenario: Merged article should only have one auther
    When I merge article "1" with article "2"
    And I am on the admin content page
    Then I should see "1" article
    And The author should be "admin"

  Scenario: Merged article should carry over comments
    Given I comment on article "1"
    And I comment on article "2"
    When I merge article "1" with article "2"
    And I am on the admin content page
    Then I should see "1" article
    And The comments should be "2"

  Scenario: Merged articles should have the same title
    When I merge article "1" with article "2"
    And I am on the admin content page
    Then I should see one "1" article
    And The title should be 'Hello World!"

