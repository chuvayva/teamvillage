Feature: create new project
  As a logged in user
  I want to create my own new project 

Background:

	Given the following users exist:
	  | name	| email						| password	|
	  | Fedor	| email_1@bk.ru		| 123456		|
	  | Max		| email_2@bk.ru		| 123456		|

	And the following projects exists:
		|	name		| owner |
		|	Mars		| Fedor |

Scenario: create project
  Given I am sign in as "Fedor"
  And I am on the home page
  When I press "New project"
  Then should see "New project creation"
  When I fill "Project name" with "Team Village"
  And press "Create"
  Then I should be on the "Team Village" project page
  And should see "Team Village"


Scenario: add task to project
  Given I am sign in as "Fedor"
  And I am on the "Mars" project page
  When I press "Add task"
  Then should see "Create task for"
  When I fill "Name" with "Create DB script"
  And fill "Executer" with "Max"
  And press "Add"
  Then I should be on "Mars" project page
  And should see "Create DB script"



