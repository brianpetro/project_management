Feature: Check my project link locations
	As a project owner
	I want project links in specific places

		Scenario: SILVER I make a project and check for a link
      Given I am logged in silver
      When I want to add a project
			And I enter a project name
			And I submit the form
      And I visit my user page
			Then I should see my project

		Scenario: GOLD I make a project and check for a link
      Given I am logged in gold
      When I want to add a project
			And I enter a project name
			And I submit the form
      And I visit my user page
			Then I should see my project

		Scenario: PLATINUM I make a project and check for a link
      Given I am logged in platinum
      When I want to add a project
			Then I should see an auth error
