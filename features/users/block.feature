Feature: block users
	As admin 
	I can ban users
	And blocked user can't sign in

Background:
  Given the following users exist:
  | email 						| name  | password		| roles |
  | baikonur_1@bk.ru 	| Max	  | 123456			| admin	|
  | baikonur_2@bk.ru 	| Fedor | 123456			|  			|



Scenario: I am not admin
	Given I am sign in as "Fedor" with password "123456"
	When I am on the users page
	Then I can not "Block" "Fedor" in ".b-data-table" table
	And I can not "Block" "Max" in ".b-data-table" table

Scenario: I am admin
	Given I am sign in as "Max" with password "123456"
	When I am on the users page
	Then I can not "Block" "Fedor" in ".b-data-table" table 
	And I can "Block" "Max" in ".b-data-table" table
	When follow "Block" button on "Max" row
	Then should see "User \'Max\'successfully blocked"