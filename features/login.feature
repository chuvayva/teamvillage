Feature: login

	As a user
	So I can login into the site

Background: 

  Given the following users exist:
  | email 				| password |
  | email_1@bk.ru | 123456 	 |

Scenario: user sign up
  Given I am on the sign up page
  When I fill in "Email" with "email_2@bk.ru"
	And fill in "Password" with "123456"
	And fill in "Password confirmation" with "123456"
	And press "Sign up"
	And should see "Welcome! You have signed up successfully"


Scenario: user sign in
  Given I am on the sign in page
	When I fill in "Email" with "email_1@bk.ru"
	And fill in "Password" with "123456"
	And press "Sign in"
	Then I should be on the home page
	And I should see "Signed in successfully"