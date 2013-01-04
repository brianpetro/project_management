Feature: New note without blueprint association
  As a registered user of the website
  I want to create a new notes specific to the project

    Scenario: SILVER I add a note to my project
			Given I am logged in silver
			When I have a project
			And I visit the project
			And I want to add a note
			And I fill in the note note
			And I fill in the note text
			And I submit the form
			Then I should see successfully created

    Scenario: GOLD I add a note to my project
			Given I am logged in gold
			When I have a project
			And I visit the project
			And I want to add a note
			And I fill in the note note
			And I fill in the note text
			And I submit the form
			Then I should see successfully created
