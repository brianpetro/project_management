### UTILITY METHODS ###

##### Written by Brian Petro #####
def create_visitor_silver
  @visitor ||= { :name => "Test Silver", :email => "exampleSilver@example.com",
    :password => "please", :password_confirmation => "please", :role => "silver" }
end
def create_visitor_gold
  @visitor ||= { :name => "Test Gold", :email => "exampleGold@example.com",
    :password => "please", :password_confirmation => "please", :role => "gold" }
end
def create_visitor_platinum
  @visitor ||= { :name => "Test Platinum", :email => "examplePlatinum@example.com",
    :password => "please", :password_confirmation => "please", :role => "platinum" }
end
def create_user_silver
  create_visitor_silver
  delete_user
  @user = FactoryGirl.create(:user, email: @visitor[:email])
  @user.add_role(@visitor[:role])
end
def create_user_gold
  create_visitor_gold
  delete_user
  @user = FactoryGirl.create(:user, email: @visitor[:email])
  @user.add_role(@visitor[:role])
end
def create_user_platinum
  create_visitor_platinum
  delete_user
  @user = FactoryGirl.create(:user, email: @visitor[:email])
  @user.add_role(@visitor[:role])
end
##### End - Brian Petro #####

def find_user
  @user ||= User.first conditions: {:email => @visitor[:email]}
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  visit '/users/sign_out'
end



def delete_user
  @user ||= User.first conditions: {:email => @visitor[:email]}
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit '/users/sign_up/?plan=silver'
  fill_in "Name", :with => @visitor[:name]
  fill_in "Email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
  click_button "Sign up"
  find_user
end

def sign_in
  visit '/users/sign_in'
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
  click_button "Sign in"
end

### GIVEN ###
##### Written by Brian Petro #####

Given /^I am logged in gold$/ do
  create_user_gold
  sign_in
end
Given /^I am logged in silver$/ do
  create_user_silver
  sign_in
end
Given /^I am logged in platinum$/ do
  create_user_platinum
  sign_in
end

Given /^I exist as a silver user$/ do
  create_user_silver
end
Given /^I exist as a gold user$/ do
  create_user_gold
end
Given /^I exist as a platinum user$/ do
  create_user_platinum
end
Given /^I do not exist as a silver user$/ do
  create_visitor_silver
  delete_user
end
Given /^I do not exist as a gold user$/ do
  create_visitor_gold
  delete_user
end
Given /^I do not exist as a platinum user$/ do
  create_visitor_platinum
  delete_user
end
##### End - Brian Petro #####



Given /^I am not logged in$/ do
  visit destroy_user_session_path
end

Given /^I exist as an unconfirmed user$/ do
  create_unconfirmed_user
end

### WHEN ###

##### Written by Brian Petro #####

When /^I sign in with valid silver credentials$/ do
  create_visitor_silver
  sign_in
end
When /^I sign in with valid gold credentials$/ do
  create_visitor_gold
  sign_in
end
When /^I sign in with valid platinum credentials$/ do
  create_visitor_platinum
  sign_in
end
When /^I visit my user page$/ do
	visit user_path(@user.id)
end
##### End - Brian Petro #####

When /^I sign out$/ do
  visit '/users/sign_out'
end

##### Begin using _silver to make sign_in features pass (Brian Petro)#####
When /^I sign up with valid user data$/ do
  create_visitor_silver
  sign_up
end

When /^I sign up with an invalid email$/ do
  create_visitor_silver
  @visitor = @visitor.merge(:email => "notanemail")
  sign_up
end

When /^I sign up without a password confirmation$/ do
  create_visitor_silver
  @visitor = @visitor.merge(:password_confirmation => "")
  sign_up
end

When /^I sign up without a password$/ do
  create_visitor_silver
  @visitor = @visitor.merge(:password => "")
  sign_up
end

When /^I sign up without a subscription plan$/ do
  visit '/users/sign_up'
end

When /^I sign up with a mismatched password confirmation$/ do
  create_visitor_silver
  @visitor = @visitor.merge(:password_confirmation => "please123")
  sign_up
end
##### End silver for sign up #####


When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

When /^I change my email address$/ do
  click_link "Edit account"
  fill_in "user_email", :with => "different@example.com"
  fill_in "user_current_password", :with => @visitor[:password]
  click_button "Update"
end

When /^I delete my account$/ do
  click_link "Edit account"
  click_link "Cancel my account"
  page.driver.browser.switch_to.alert.accept
end

When /^I follow the subscribe for silver path$/ do
  visit '/users/sign_up/?plan=silver'
end

### THEN ###


Then /^I should be signed in$/ do
  page.should have_content "Logout"
  page.should_not have_content "Sign up"
  page.should_not have_content "Login"
end

Then /^I should be signed out$/ do
  page.should have_content "Login"
  page.should_not have_content "Logout"
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content text
end

Then /^I should be on the "([^"]*)" page$/ do |path_name|
  current_path.should == send("#{path_name.parameterize('_')}_path")
end

Then /I should be on the new silver user registration page$/ do
  current_path_with_args.should == '/users/sign_up/?plan=silver'
end

Then /^I should be on the user page$/ do
  current_path_with_args.should == '/users/1'
end

Then /^I see an unconfirmed account message$/ do
  page.should have_content "You have to confirm your account before continuing."
end

Then /^I see a successful sign in message$/ do
  page.should have_content "Signed in successfully."
end

Then /^I should see a successful sign up message$/ do
  page.should have_content "Welcome! You have signed up successfully."
end

Then /^I should see an invalid email message$/ do
  page.should have_content "is invalid"
end

Then /^I should see a missing password message$/ do
  page.should have_content "can't be blank"
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "doesn't match confirmation"
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "doesn't match confirmation"
end

Then /^I should see a missing subscription plan message$/ do
  page.should have_content "Please select a subscription plan below"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I see an invalid login message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I should see an account edited message$/ do
  page.should have_content "You updated your account successfully."
end

Then /^I should see an account deleted message$/ do
  page.should have_content "account was successfully cancelled"
end

Then /^I should see my name$/ do
  create_user
  page.should have_content @user[:name]
end
