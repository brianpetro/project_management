##### Written by Brian Petro #####

def create_project
	@project = FactoryGirl.create(:project, name: "Test Project1")
end
When /^I have a project$/ do
	create_project
end
When /^I visit the project$/ do
	visit project_path(@project.id)
end
When /^I want to add a blueprint$/ do
	visit new_project_blueprint_path(@project.id)
end
When /^I want to add a project$/ do
	visit '/projects/new'
end
When /^I fill in blueprint title$/ do
	fill_in "blueprint_title", :with => "Blueprint Test 1"
end
When /^I enter a project name$/ do
	fill_in "project_name", :with => "Test Project1"
end

When /^I submit the form$/ do
	click_button 'submit'
end


Then /^I should see successfully created$/ do
	page.should have_content 'successfully created.'
end
Then /^I should see a project created message$/ do
	page.should have_content 'Project was successfully created.'
end

Then /^I should see an auth error$/ do
	page.should have_content 'You are not authorized to access this page.'
end

Then /^I should see my project$/ do
	page.should have_content 'Test Project1'
end
