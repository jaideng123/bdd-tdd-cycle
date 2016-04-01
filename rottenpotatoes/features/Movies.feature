Feature: search for movies by director

  As a movie buff
  So that I can find movies with my favorite director
  I want to include and serach on director information in movies I enter

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: add director to existing movie
  When I go to the edit page for "Alien"
  And  I fill in "Director" with "Ridley Scott"
  And  I press "Update Movie Info"
  Then the director of "Alien" should be "Ridley Scott"

Scenario: find movie with same director
  Given I am on the details page for "Star Wars"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Star Wars"
  And   I should see "THX-1138"
  But   I should not see "Blade Runner"

Scenario: can't find similar movies if we don't know director (sad path)
  Given I am on the details page for "Alien"
  Then  I should not see "Ridley Scott"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the home page
  And   I should see "'Alien' has no director info"

Scenario: see list of movies
  When I go to the home page
  Then I should see "THX-1138"
  And I should see "Alien"
  And I should see "Blade Runner"
  And I should see "Star Wars"

Scenario: see list of movies sorted by title
  When I go to the home page
  And  I follow "Movie Title"
  Then I should be on the home page
  And I should see "Alien" before "Blade Runner"

Scenario: see list of movies sorted by release date
  When I go to the home page
  And  I follow "Release Date"
  Then I should be on the home page
  And I should see "Star Wars" before "Alien"
  
Scenario: see list of movies filtered by rating
  When I go to the home page
  And  I uncheck "ratings_PG"
  And  I press "Refresh"
  Then I should be on the home page
  And I should not see "Star Wars"

Scenario: add new movie
  When I go to the add movie page
  And I fill in "Title" with "Oscar Bait"
  And I fill in "Director" with "Steven Spiels"
  And  I press "Save Changes"
  Then I should be on the home page
  And I should see "Oscar Bait"
  
Scenario: remove movie
  When I go to the details page for "Star Wars"
  And  I press "Delete"
  Then I should be on the home page