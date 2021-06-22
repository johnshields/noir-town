Feature: find tunes by artist
    As a fan of Miles Davis
    So that I can find more tunes by him
    I want to go to a dedicated page for him
    
Background: tunes in database
    Given these tunes exist in the db:
    | title             | artist          | album                    | release_date |                                                        
    | Blue in Green     | Miles Davis     | Kind Of Blue             | 1959-08-17   | 
    | Small             | Portishead      | Third                    | 2008-04-28   |  
    | Harlem Nocturne   | The Viscounts   | Harlem Nocturne          | 1965-04-08   |
    | Moanin            | Art Blakey      | Moanin                   | 1959-10-30   | 
    | Caseys Song       |                 | Whiplash                 | 2014-10-10   | 
    | Changing Partners | Jonny Greenwood | The Master               | 2012-01-13   | 
    | Generique         | Miles Davis     | Ascenseur pour lechafaud | 1958-01-29   | 

    And I am on the Noir Town home page
    Then I should see "Miles Davis"
    
Scenario: find tunes by the same artist
    Given I am on the details page for "Blue in Green"
    When I follow "Tunes by Miles Davis"
    Then I should be on the Tunes Page for "Blue in Green"
    And I should see "Generique"
    But I should not see "Changing Partners"
    
Scenario: when tune has no artist in the db
    Given I am on the details page for "Caseys Song"
    Then I should not see "Justin Hurwitz"
    When I follow "Tunes by"
    Then I should be on the home page
    And I should see "'Caseys Song' has no artist info"