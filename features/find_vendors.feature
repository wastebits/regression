Feature: Find Vendors

   In order to properly dispose of my waste
   As a waste generator (aka "Waste Producer")
   I want to find vendors that can accept my Waste

   Scenario: Get Search Results
    Given I am on the Vendor Locator search page
    When I search for "sludge"
    Then I see more than 0 search results

   Scenario: Profile waste without have a Wastebits account
    Given I am on a Vendor Locator detail page that is enabled for waste profile leads
    When I click the button to start profiling waste for that location
    Then I see the Waste Profile form
    And I see the name of the location I was viewing
    And I see the address for that location

   Scenario Outline: Access to Industry forms
    Given I am on the Waste Forms Library page
    When I click <pageName>
    Then I do not receive an error page

    Examples:
    | pageName |
    | Benzene Waste Operations NESHAP Worksheet |
    | Non-Hazardous Waste Manifest |
    | Third Party Authorization for Special Waste Disposal |

   Scenario: Request pricing
    Given I am on the Vendor Locator search page
    When I search for "soil"
    And I select a resulting entry
    And I click "Request Pricing"
    And I populate the form
    And I submit the form
    Then I see a confirmation page
    And I see a reference number