Feature: tasks list on the home page

As a logged user
I can see list of tasks of chosen project

Background:

  Given the following users exist:
	  | email							| password | name 	|
	  | baikonur_1@bk.ru	| 123456 	 | Fedor	|
	  | baikonur_2@bk.ru 	| 123456 	 | Max		|

	And the following projects exist:
		|	name		| owner |
		|	Venus 	| Max	  |
		|	Mars		| Max	  |

	And the following tasks exist:
		|	name							| project 	| persentage |
		|	Count satellites	| Venus		  | 90 				 |
		|	Meet martians			| Mars		  | 60 				 |
		|	Buy sunglasses		| Mars		  | 90 				 |


Scenario: user hasn't project
	Given I am sign in as "Fedor" with password "123456"
	And I am on the home page
	Then should see 0 rows in ".b-data-table" table

Scenario: user view all tasks
	Given I am sign in as "Max" with password "123456"
	And I am on the home page
	Then should see 3 rows in ".b-data-table" table

# Scenario: user can switch between projects
# 	Given I am sign in as "Fedor" with password "123456"
# 	And I am on the home page
# 	Then I should not see ".b-tasks"
