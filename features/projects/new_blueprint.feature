Feature: New Blueprint
  As a registered user of the website
  I want to create a new blueprint

    Scenario: SILVER I add a blueprint to my project
			Given I am logged in silver
			When I have a project
			And I visit the project
			And I want to add a blueprint
			And I fill in blueprint title
			And I submit the form
			Then I should see successfully created

    Scenario: GOLD I add a blueprint to my project
			Given I am logged in gold
			When I have a project
			And I visit the project
			And I want to add a blueprint
			And I fill in blueprint title
			And I submit the form
			Then I should see successfully created
