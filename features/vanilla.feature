Feature: Submit and Approve a Profile
 In order to get my Waste moving to a Facility
 As a Profile Submitter
 I want to be able to get my Waste Profile approved

  Scenario: Submit a waste profile for approval
    Given I'm member of "Wastebits Cucumber Composter"
    When I start a new Profile
    And I specified the profile name "Rotten Cucumbers"
    And I specified the generator "Wastebits Cucumber Factory"
    And I specified the waste facility "Wastebits Cucumber Composter"
    And I specified the billing company "Wastebits Cucumber Composter"
    And I "Submit" the Waste Profile for approval
    And I go to the Profile list
    Then I see my Waste Profile in "Pending" status
