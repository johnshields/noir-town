Feature: User can add a new tune
    As a fan of jazz
    So that I can share my taste
    I want to add a new tune to Noir Town
  
Scenario: Add a tune
    Given I am on the Noir Town home page
    When I follow "Add a new Tune"
    Then I should be on the Add a new Tune page
    When I fill in "Title" with "Blue in Green"
    And I fill in "Artist" with "Miles Davis"
    And I fill in "Album" with "Kind Of Blue"
    And I fill in "Release Date" with "17-08-1959"
    And I fill in "Emded Spotify URL" with "https://open.spotify.com/embed/track/0aWMVrwxPNYkKmFthzmpRi"
    And I press "Add"
    Then I should be on the Noir Town home page
    And I should see "Blue in Green"  

Scenario: Add an invalid Tune
    Given I am on the Noir Town home page
    When I follow "Add a new Tune"
    Then I should be on the Add a new Tune page
    When I fill in "Title" with ""
    And I fill in "Artist" with "Jimmy Scott"
    And I fill in "Album" with "Fire Walk With Me"
    And I press "Add"
    Then I should see "Title can't be blank"