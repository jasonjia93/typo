Feature:
  As a scrub
  In order to figure out what is going on
  I want to see if articles are automatically generated

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: please
    When I go to the home page
    Then I should see "Hello World!"
