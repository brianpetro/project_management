Feature: New Project Silver
  As a registered user of the website
  I want to create a new project

    Scenario: SILVER I sign in and create a project
      Given I am logged in silver
      When I want to add a project
			And I enter a project name
			And I submit the form
      Then I should see a project created message

    Scenario: GOLD I sign in and create a project
      Given I am logged in gold
      When I want to add a project
			And I enter a project name
			And I submit the form
      Then I should see a project created message

	  Scenario: PLATINUM I sign in and create a project
	    Given I am logged in platinum
	    When I want to add a project
			Then I should see an auth error
