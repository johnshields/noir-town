Feature: Listen to a tune preview
    As a User who is unfamiliar with this tune
    So that I can listen to it
    I want to click on the preview
    
Background: tunes in database
    Given these tunes exist in the db:
    | title           | artist        | album           | release_date | url                                                         | 
    | Blue in Green   | Miles Davis   | Kind Of Blue    | 1959-08-17   | https://open.spotify.com/embed/track/0aWMVrwxPNYkKmFthzmpRi |
    | Harlem Nocturne | The Viscounts | Harlem Nocturne | 1965-04-08   |                                                             |

Scenario: Listen to a preview
    When I go to the details page for "Blue in Green"
    Then I should see "Listen to a preview"
    And I should not see "No preview available :("
    When I click on the preview
    Then I should hear the tune
    
Scenario: Add an Emded Spotify URL to an existing tune
    When I go to the details page for "Harlem Nocturne"
    Then I should see "No preview available :("
    And I follow "Edit"
    Then I should see "Editing Harlem Nocturne"
    Then I fill in "Emded Spotify URL" with "https://open.spotify.com/embed/track/19DUpdPWw5TuQiElDqVpMd"
    And I press "Update"
    When I go to the details page for "Harlem Nocturne"
    Then I should not see "No preview available :("   