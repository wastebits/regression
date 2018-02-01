Feature: Logging in
  Users with valid usernames and passwords can login
  Users with locked accounts cannot log in
  Users with invalid usernames or passwords cannot log in

  Scenario: Locked accounts cannot log in
    Given my user account is locked
    When I attempt to log into the Wastebite Profiling application
    Then I see "Invalid username and password"

  Scenario: Valid users can log in
    Given my user account is not locked
    And I have membership in 1 company
    When I attempt to log into the Wastebits Profiling application
    Then I see the list of Waste Streams