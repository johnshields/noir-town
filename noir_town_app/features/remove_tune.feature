Feature: Remove a tune
    As the Admin of Noir Town
    So that I can remove tunes not of the jazz genre
    I want to remove a tune
    
Background: tunes in database
    Given these tunes exist in the db:
    | title         | artist          | album                  | release_date |                                                        
    | As I Am       | Michael Brecker | Time Is Of The Essence | 1999-08-17   | 
    | Ruby          | Kaiser Chiefs   | Yours Turly, Angry Mob | 2007-02-05   |  
    | Daily Battles | Thom Yorke      | Motherless Brooklyn    | 2019-09-30   |

    And I am on the Noir Town home page
    Then I should see "Ruby"  
    
Scenario: remove a tune
   Given I am on the details page for "Ruby"
   When I follow "Remove"
   Then I should be on the home page
   And I should not see "Ruby"    