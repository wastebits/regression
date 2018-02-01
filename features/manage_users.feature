Feature: Manage Users

   In order to ensure users have minimum necessary access to accomplish their goals
   As a User Administrator
   I want to be able to configure permissions for users

   Scenario: Invite a user to a public company
    Given I belong to only one Company
    And that company is Public
    When I invite a new user
    Then an invitation is sent to that user

   Scenario: Invite a user to a private company
    Given I belong to only one Company
    And that company is Private 
    And I am an Administrator for that Company
    When I invite a new user
    Then an invitation is sent to that user

    Scenario: Normal users cannot invite others to a public company
    Given I belong to only one Company
    And that company is Public
    And I am not an Administrator for that Company
    Then I am not able to invite a new user
    And I can see who has been invited to that Company

   Scenario: Add permissions
    Given I belong to only one Company
    And I am an Administrator for that Company
    And I am currently not an Approver for that Company
    When I navigate to User Administration
    Then I can add Approver permission to myself

   Scenario: Remove permissions
    Given I belong to only one Company
    And I am an Administrator for that Company
    And I am an Approver for that Company
    And I am currently not an Approver for that Company
    When I navigate to User Administration
    Then I can remove Approver permission from myself

   Scenario: Lock a user

   Scenario: Revoke and invitation
   Given I belong to only one Company
   And that company is Public
   And I am an Administrator for that Company
   And there is one unclaimed invitation for that Company
   And I delete that invitation
   Then the invitation cannot be accepted
