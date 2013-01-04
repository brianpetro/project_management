Feature: New note with blueprint association from show page
  As a registered user of the website
  I want to create a new note specific to a blueprint

    Scenario: SILVER I add a note to my project
			Given I am logged in silver
			When I have a project
			And I have a project blueprint
			And I visit the blueprint show page
			And I want to add a note
			And I fill in the note note
			And I fill in the note text
			And I submit the form
			Then I should see successfully created

    Scenario: GOLD I add a note to my project
			Given I am logged in gold
			When I have a project
			And I have a project blueprint
			And I visit the blueprint show page
			And I want to add a note
			And I fill in the note note
			And I fill in the note text
			And I submit the form
			Then I should see successfully created
