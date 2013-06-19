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
	And I am on the sign in page

Scenario: admin sign in
	When I fill in "Email" with "email_1@bk.ru"
	And fill in "Password" with "123456"
	And press "Sign in"
	Then I should see "Signed in successfully"