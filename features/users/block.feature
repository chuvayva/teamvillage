Feature: blocking users
	As admin 
	I can ban users
	And blocked user can't sign in

Background:
  Given the following users exist:
  | email 						| name   | password		| roles | blocked |
  | baikonur_1@bk.ru 	| Max	   | 123456			| admin	|					|
  | baikonur_2@bk.ru 	| Fedor  | 123456			|  			|					|
  | baikonur_3@bk.ru 	| Blocker| 123456			|  			|		true	|


Scenario: User can block if user admin 
	Given I am sign in as "Max" with password "123456"
	When I am on edit "Max" user page
	Then I should not see "Blocked"
	When I am on edit "Fedor" user page
	Then I should see "Blocked"
	
Scenario: Blocking
	Given I am sign in as "Max" with password "123456"
	And I am on edit "Fedor" user page
	When I check "Blocked"
	And press "Save"
	Then I should see "User was successfully updated"

Scenario: Blocked user can't sign in
	Given I am sign in as "Blocker" with password "123456"
	Then I should see "This account has been blocked by admins"

