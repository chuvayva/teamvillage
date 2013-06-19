Feature: login

	As a user of one of three role (admin, manager and developer)
	So I can login into the site

Background: 

	# Given user with "admin" role
	# And user with "manager" role
	# And user with "developer" role
  Given the following users exist:
  | email 				| password |
  | email_1@bk.ru | 123456 	 |

Scenario: user sign up
  Given I am on the sign up page
  When I fill in "Email" with "email_2@bk.ru"
	And fill in "Password" with "123456"
	And fill in "Password confirmation" with "123456"
	And press "Sign up"
	Then I should see "Welcome! You have signed up successfully"


Scenario: user sign in
  # I am on the sign out page
  Given I am on the sign in page
	When I fill in "Email" with "email_1@bk.ru"
	And fill in "Password" with "123456"
	And press "Sign in"
	Then I should see "Signed in successfully"