Feature: login with according rights of role

	As a user of one of three role (admin, manager and developer)
	So I can login into the site

Background: 

	Given user "mail_1@m.ru" with "admin" role
	And user "mail_2@m.ru" with "manager" role
	And user "mail_3@m.ru" with "developer" role

	And I am on the sign in page

Scenario: admin sign in
	When I fill in "Email" with "mail_1@m.ru"
	And fill in "Password" with "pass1"
	And press "Sign in"
	Then I should see "Signed in successfully"
	And should has "admin" role