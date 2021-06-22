Feature: search a tune
    As a User who wants to find a tune
    So that I can search for it
    I want to search by title, artist and album

Background: tunes in database
    Given these tunes exist in the db:
    | title             | artist          | album                    | release_date |                                                        
    | Blue in Green     | Miles Davis     | Kind Of Blue             | 1959-08-17   | 
    | Harlem Nocturne   | The Viscounts   | Harlem Nocturne          | 1965-04-08   |
    | Moanin            | Art Blakey      | Moanin                   | 1959-10-30   | 
    | Caseys Song       | Justin Hurwitz  | Whiplash                 | 2014-10-10   | 
    | Changing Partners | Jonny Greenwood | The Master               | 2012-01-13   | 
    | Generique         | Miles Davis     | Ascenseur pour lechafaud | 1958-01-29   | 

    And I am on the Noir Town home page
    Then 6 seed tunes should exist
    
Scenario: search by title
    Given I fill in "Search by" with "Blue in Green"
    Then I pick "Title" from the options box
    And I press "Search"
    Then I should see "Miles Davis"
    And I should not see "The Viscounts"
    
Scenario: search by title not in the db
    Given I fill in "Search by" with "Come Fly With Me"
    Then I pick "Title" from the options box
    And I press "Search"
    Then I should see "Come Fly With Me not found :("
    
Scenario: search by artist
    Given I fill in "Search by" with "Art Blakey"
    Then I pick "Artist" from the options box
    And I press "Search"
    Then I should see "Moanin"
    And I should not see "Blue in Green"
    
Scenario: search by artist not in the db
    Given I fill in "Search by" with "Louis Armstrong"
    Then I pick "Artist" from the options box
    And I press "Search"
    Then I should see "Louis Armstrong not found :("

Scenario: search by album
    Given I fill in "Search by" with "Whiplash"
    Then I pick "Album" from the options box
    And I press "Search"
    Then I should see "Caseys Song"
    And I should not see "Changing Partners"
    
Scenario: search by album not in the db
    Given I fill in "Search by" with "In Person"
    Then I pick "Album" from the options box
    And I press "Search"
    Then I should see "In Person not found :("