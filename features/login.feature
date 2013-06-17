Feature: login with according rights of role

	As a user of one of three role (admin, manager and developer)
	So I can login into the site

Background: 

	Given user 'Fedor' as :developer
	And user 'Alex' as :manager
	And user 'Max' as :admin