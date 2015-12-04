@Rooms
Feature: Rooms
  Background:
    Given Im logged in with the user "" and password ""


  Scenario Outline: Place a room to out of order
    Given I navigate to Conference Rooms tab
    When I navigate to "Floor1Room10" room for edit
      And I navigate the Out of Order Planning Tab
      And I configure the room with the option out of order "<Out Of Order>"
    Then a information message should be displayed
    And should display an icon on the Out Of Order column
    And the out of order state should be obtained using the API

    Examples:
      |       Out Of Order     |
      | Closed for maintenance |
      | Closed for reparations |

  Scenario Outline: Place a room to out of order with invalid date
    Given I navigate to Conference Rooms tab
    When I navigate to "Floor1Room10" room for edit
      And I navigate the Out of Order Planning Tab
      And I configure the room with the option out of order "<Out Of Order>"
      And I place a date with invalid hour range
    Then a error message should be displayed
      And the out of order state should not be obtained using the API

    Examples:
      |       Out Of Order     |
      | Closed for maintenance |
      | Closed for reparations |