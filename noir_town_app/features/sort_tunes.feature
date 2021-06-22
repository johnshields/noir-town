Feature: sort tunes by their information
    As a User who likes to be organized
    So that I can see the imporant information of tunes in order
    I want to see tunes sorted by title, artist, ablum or release date 
    
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
    
Scenario: sort tunes by title
    When I follow "Title"
    Then I should see "Caseys Song" before "Blue in Green"
    
Scenario: sort tunes by artist
    When I follow "Artist"
    Then I should see "Art Blakey" before "Miles Davis"
  
Scenario: sort tunes by album
    When I follow "Album"
    Then I should see "Ascenseur pour lechafaud" before "Whiplash"
    
Scenario: sort tunes by release date
    When I follow "Release Date"
    Then I should see "Generique" before "Harlem Nocturne"